import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/layout/cubit/cubit.dart';
import 'package:testo/layout/cubit/states.dart';
import 'package:testo/models/message_model.dart';
import 'package:testo/models/social_user_model.dart';
import 'package:testo/shared/components/components.dart';
import 'package:testo/shared/styles/colors.dart';

class ChatDetailsScreen extends StatelessWidget {

  SocialUserModel? userModel;

  ChatDetailsScreen({Key? key,
    this.userModel,
}) : super(key: key);

  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getMessages(receiverId: userModel!.uId);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        userModel!.image,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      userModel!.name,
                    ),
                  ],
                ),
              ),
              body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:
                      [
                        ConditionalBuilder(
                          condition: SocialCubit.get(context).messages.length > 0,
                          builder: (context) {
                            return Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var message = SocialCubit.get(context).messages[index];
                                  if(SocialCubit.get(context).userModel!.uId == message.senderId)
                                    return buildMyMessage(message);

                                  return buildMessage(message);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15.0,
                                ),
                                itemCount: SocialCubit.get(context).messages.length,
                              ),
                            );
                          },
                          fallback: (context) => Center(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type your message here ...',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                color: defaultColor,
                                child: MaterialButton(
                                  onPressed: (){
                                    SocialCubit.get(context).sendMessage(
                                      receiverId: userModel!.uId,
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text,
                                    );
                                  },
                                  minWidth: 1.0,
                                  child: Icon(
                                    Icons.send,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
          topStart: Radius.circular(10.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,

      ),
      child: Text(
        model.text,
      ),
    ),
  );

  Widget buildMyMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: defaultColor.withOpacity(0.2),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
          topStart: Radius.circular(10.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,

      ),
      child: Text(
        model.text,
      ),
    ),
  );
}
