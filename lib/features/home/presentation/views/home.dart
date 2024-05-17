import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wedvision/constants.dart';
import 'package:wedvision/core/utils/assets.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<Map<String, String>> sliderItems = [
    {
      'image': AssetsData.sliderImage,
      'title': 'Rusty inn',
    },
    {
      'image': AssetsData.sliderImage,
      'title': 'El Gawharah',
    },
    {
      'image': AssetsData.sliderImage,
      'title': 'Marshal',
    },
  ];

  final List<Map<String, String>> contentItems = [
    {
      'image': AssetsData.hallImage,
      'capacitance': 'Rp. 4.500.000',
      'address': 'Harga per 8 jam',
      'title': 'Metro, Lampung',
      'space': '1000m2',
    },
    {
      'image': AssetsData.hallImage2,
      'capacitance': 'Rp. 4.000.000',
      'address': 'Harga per 8 jam',
      'title': 'Metro, Lampung',
      'space': '2000m2',
    },
    // {
    //   'image': 'assets/content3.jpg',
    //   'title': 'Content 3',
    //   'subtitle': 'This is the subtitle for content 3',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainBackGroundColor,
        appBar: AppBar(
          elevation: 5,
          title: Text('Home', style: TextStyle(fontSize: 22.sp, fontFamily: AssetsData.mainFont)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              // favorite button action here
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: Colors.blue),
              onPressed: () {
                // profile button action here
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric( vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    children: [
                      Text('Halls Near you',
                          style: TextStyle(fontSize: 22.sp, fontFamily: AssetsData.mainFont)),

                      const Spacer(),

                      IconButton(onPressed: (){},
                        icon: const Icon(Icons.filter_list, color: primaryColor),),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                  items: sliderItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: AssetImage(item['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10.h,
                                left: 10.w,
                                child: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                    horizontal: 10.w,
                                  ),
                                  child: Text(
                                    item['title']!,
                                    style: TextStyle(
                                      fontFamily: AssetsData.mainFont,
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    'Our Halls',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AssetsData.mainFont,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  children: contentItems.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, detailsScreen);
                      },
                      child: Card(
                        surfaceTintColor: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['capacitance']!,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: AssetsData.mainFont,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          item['address']!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                            fontFamily: AssetsData.mainFont,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          item['title']!,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: AssetsData.mainFont,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          item['space']!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                            fontFamily: AssetsData.mainFont,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

