import 'package:testo/modules/social_app/social_login/social_login_screen.dart';
import 'package:testo/shared/network/local/cache_helper.dart';
import 'components.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'uId').then((value) {
    if(value)
    {
      navigateAndFinish((context), SocialLoginScreen(),);
    }
  });
}

String? token = '';

String? uId = '';