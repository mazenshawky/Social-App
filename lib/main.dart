import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testo/layout/social_layout.dart';
import 'package:testo/modules/social_app/social_login/social_login_screen.dart';
import 'package:testo/shared/bloc_observer.dart';
import 'package:testo/shared/components/constants.dart';
import 'package:testo/shared/cubit/cubit.dart';
import 'package:testo/shared/cubit/states.dart';
import 'package:testo/shared/network/local/cache_helper.dart';
import 'package:testo/shared/network/remote/dio_helper.dart';
import 'package:testo/shared/styles/themes.dart';
import 'layout/cubit/cubit.dart';

void main()
{
  BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();

          await Firebase.initializeApp(
            //options: DefaultFirebaseOptions.currentPlatform,
          );

          DioHelper.init();
          await CacheHelper.init();
          
          bool? isDark = CacheHelper.getData(key: 'isDark');

          Widget widget;

          uId = CacheHelper.getData(key: 'uId');


          if(uId != null)
            widget = SocialLayout();
          else
            widget = SocialLoginScreen();

          runApp(MyApp(
            isDark: isDark,
            startWidget: widget,
          ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget
{
  final bool? isDark;
  final Widget? startWidget;

  MyApp({Key? key,
    this.isDark,
    this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            //themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}