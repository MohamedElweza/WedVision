import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedvision/constants.dart';
import 'package:wedvision/core/utils/assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
  //
  // void _skip() {
  //   _pageController.animateToPage(
  //     2,
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void _getStarted() {
    Navigator.pushNamed(context, '/signIn');
  }

  void _next() {
    if (_currentPage != 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: const [
                OnBoardingPage(
                  image: AssetsData.onBoarding1,
                  title: 'Easy to find Hall',
                  subtitle: 'You will find your perfect Venue.',
                ),
                OnBoardingPage(
                  image: AssetsData.onBoarding2,
                  title: 'Fixed a Date for Wedding',
                  subtitle: 'Easy to choose a date.',
                ),
                OnBoardingPage(
                  image: AssetsData.onBoarding11,
                  title: 'Virtual Reality For Hall',
                  subtitle: 'Experience the hall like never before with our immersive VR tour.',
                ),
              ],
            ),
             Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: _currentPage != 2
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate( 3,
                          (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                 TextButton(
                    onPressed: _next,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontFamily: 'MainFont'),
                    ),
                  ),

                ]

              ) : ElevatedButton(
            onPressed: _getStarted,
            style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
              fixedSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const Text('Get Started', style: TextStyle(
            color: Colors.white,
                fontFamily: 'MainFont'
            ))
      ), )

                ],
        ),
      ),
    );
  }
}




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