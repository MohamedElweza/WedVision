import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpElevatedButton extends StatelessWidget {
  const CustomSignUpElevatedButton({
    super.key, required this.buttonColor, required this.title, required this.buttonSize, required this.onPressed, required this.icon,
  });

  final Color buttonColor ;
  final String title ;
  final double buttonSize ;
  final VoidCallback onPressed ;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize: Size(buttonSize, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white,),
          SizedBox(width: 15.w,),
          Text(
            title, style: TextStyle(
            color: Colors.white,
            fontFamily: 'MainFont',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    );
  }
}