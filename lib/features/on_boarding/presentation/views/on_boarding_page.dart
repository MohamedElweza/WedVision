import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnBoardingPage({super.key, required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Image.asset(image, height: 300.h, width: double.infinity),
        ),
        SizedBox(height: 20.h),
        Text(
          title,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, fontFamily: 'MainFont'),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey, fontFamily: 'MainFont'),
          ),
        ),
      ],
    );
  }
}