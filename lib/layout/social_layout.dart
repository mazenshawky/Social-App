import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/modules/social_app/new_post/new_post_screen.dart';
import 'package:testo/shared/components/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state)
      {
        if(state is SocialNewPostState)
        {
          navigateTo(
            context,
            NewPostScreen(),
          );
        }
      },
      builder: (context, state)
      {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions:
            [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                      Icons.notifications_none,
                  ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                      Icons.search,
                  ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload_file,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
