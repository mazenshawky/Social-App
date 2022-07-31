import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/models/social_user_model.dart';
import 'package:testo/modules/social_app/social_register/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
  required String name,
  required String email,
  required String password,
  required String phone,
})
  {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid
      );
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
})
  {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'write your bio...',
      image: 'https://img.freepik.com/free-photo/teen-girl-portrait-close-up_23-2149231222.jpg?t=st=1649185211~exp=1649185811~hmac=aef1b9e315f3ca2a931b12992c7a3f1db49a6c1fa2c1f05a425cd9ed3b773ae9&w=740',
      cover: 'https://img.freepik.com/free-photo/teen-girl-portrait-close-up_23-2149231222.jpg?t=st=1649185211~exp=1649185811~hmac=aef1b9e315f3ca2a931b12992c7a3f1db49a6c1fa2c1f05a425cd9ed3b773ae9&w=740',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value)
    {
          emit(SocialCreateUserSuccessState(model.uId));
    })
        .catchError((error){
          print(error.toString());
          emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}