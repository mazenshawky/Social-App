import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/shared/components/components.dart';

import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var postImage = SocialCubit.get(context).postImage;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                function: ()
              {
                var now = DateTime.now();

                if(SocialCubit.get(context).postImage == null){
                  SocialCubit.get(context).createPost(
                      dateTime: now.toString(),
                      text: textController.text,
                  );
                } else {
                  SocialCubit.get(context).uploadPostImage(
                    dateTime: now.toString(),
                    text: textController.text,
                  );
                }
              },
                text: 'Post',
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(
                  height: 10.0,
                  ),
                Row(
                  children:
                  [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/wonderful-girl-with-wavy-hair-modern-plaid-light-clothes-holding-pink-flowers-looking-into-camera-isolated-background_197531-28770.jpg?w=740&t=st=1649187086~exp=1649187686~hmac=185a121d7d070e04c99d65727ad8af37accf9bf309b16af7d6d7d78e9f3a8d03',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        'Mazen Shawky',
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'what is on your mind ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0,),
                        image: DecorationImage(
                          image: FileImage(postImage!) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(
                          Icons.close,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: ()
                        {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Icon(
                              Icons.image_outlined,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'add photo',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(onPressed: (){},
                        child: Text(
                          '# tags',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
