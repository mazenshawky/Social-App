import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/modules/social_app/social_login/cubit/cubit.dart';
import 'package:testo/modules/social_app/social_login/cubit/states.dart';
import 'package:testo/modules/social_app/social_register/social_register_screen.dart';
import 'package:testo/shared/components/components.dart';
import 'package:testo/shared/components/constants.dart';

import '../../../layout/social_layout.dart';
import '../../../shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state)
        {
          if(state is SocialLoginErrorState)
          {
            print('error');
          }
          if(state is SocialLoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              uId = CacheHelper.getData(key: 'uId');
              navigateAndFinish(context,
                SocialLayout(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Login now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value){
                            if(value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          suffixPressed: (){
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value){
                            if(value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: (){
                              if(formKey.currentState!.validate())
                              {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  SocialRegisterScreen(),
                                );
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
