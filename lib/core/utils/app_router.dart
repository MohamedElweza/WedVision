import 'package:flutter/material.dart';
import 'package:wedvision/features/home/presentation/views/details_screen.dart';
import 'package:wedvision/features/home/presentation/views/home.dart';
import 'package:wedvision/features/registration/presentation/views/phone_auth.dart';
import 'package:wedvision/features/registration/presentation/views/sign_in.dart';
import 'package:wedvision/features/registration/presentation/views/sign_up.dart';
import 'package:wedvision/features/registration/presentation/views/welcome_screen.dart';
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

      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case phoneScreen:
        return MaterialPageRoute(builder: (_) => const PhoneSignUpScreen());

      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case detailsScreen:
        return MaterialPageRoute(builder: (_) => const DetailScreen());


    }
    return null;
  }

}