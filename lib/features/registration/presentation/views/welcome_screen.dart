import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedvision/constants.dart';
import 'package:wedvision/core/utils/assets.dart';
import 'package:wedvision/core/widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: 40.h,
              ),

              // Background image
              Image.asset(
                AssetsData.backGroundImage,
                fit: BoxFit.cover,
              ),

              // Content on top of the background
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontFamily: AssetsData.mainFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Welcome to our app. Get started to explore!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AssetsData.mainFont,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  CustomElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, homeScreen);
                      },
                      text: 'Get Started',
                      width: MediaQuery.of(context).size.width)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
