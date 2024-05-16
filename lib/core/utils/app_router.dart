import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../features/on_boarding/presentation/views/on_boardong_screen.dart';


class AppRouter{

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){

      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      // case welcomeScreen:
      //   return MaterialPageRoute(builder: (_) => const WelcomePage());


    }
    return null;
  }

}