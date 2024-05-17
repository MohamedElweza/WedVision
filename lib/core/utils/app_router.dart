import 'package:flutter/material.dart';
import 'package:wedvision/features/registration/presentation/views/sign_in.dart';
import 'package:wedvision/features/registration/presentation/views/sign_up.dart';
import '../../constants.dart';
import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';


class AppRouter{

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){

      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // case welcomeScreen:
      //   return MaterialPageRoute(builder: (_) => const WelcomePage());


    }
    return null;
  }

}