import 'package:craft_buy/feature/auth/presentation/screen/signin_screen.dart';
import 'package:craft_buy/feature/auth/presentation/screen/signup_screen.dart';
import 'package:craft_buy/feature/auth/presentation/screen/splash_screen.dart';
import 'package:craft_buy/feature/auth/presentation/screen/verify_otp_screen.dart';
import 'package:craft_buy/feature/common/prsentation/screen/main_nav_holder_screen.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    Widget widget = SizedBox();

    if (settings.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (settings.name == SignUpScreen.name) {
      widget = SignUpScreen();
    } else if (settings.name == SignInScreen.name) {
      widget = SignInScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      widget = VerifyOtpScreen();
    } else if (settings.name == MainNavHolderScreen.name) {
      widget = MainNavHolderScreen();
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
