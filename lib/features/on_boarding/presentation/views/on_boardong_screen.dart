import 'package:flutter/material.dart';
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

  void _skip() {
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _getStarted() {
    // Handle the "Get Started" action here.
    // For example, navigate to the main screen of your app.
  }

  void _next() {
    if (_currentPage != 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
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
              children: [
                OnBoardingPage(
                  image: AssetsData.onBoarding1,
                  title: 'Easy to find Hall',
                  subtitle: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.',
                ),
                OnBoardingPage(
                  image: AssetsData.onBoarding2,
                  title: 'Fixed a Date for Wedding',
                  subtitle: 'This is the second onboarding screen.',
                ),
                OnBoardingPage(
                  image: AssetsData.onBoarding3,
                  title: 'Virtual Reality For Hall',
                  subtitle: 'This is the third onboarding screen.',
                ),
              ],
            ),
             Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: _currentPage != 2
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      3,
                          (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                 TextButton(
                    onPressed: _next,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                ]

              ) : ElevatedButton(

            onPressed: _getStarted,
            style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            ),
            child: Text('Get Started', style: TextStyle(
            color: Colors.white,
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

  OnBoardingPage({required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}