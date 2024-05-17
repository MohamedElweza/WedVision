import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wedvision/core/utils/assets.dart';
import 'package:wedvision/core/widgets/custom_elevated_button.dart';
import 'package:wedvision/features/home/presentation/views/widgets/custom_icon_button.dart';

import '../../../../constants.dart';
import '../../../payment/presentation/views/payment_methods.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[
                  Image.asset(AssetsData.details1Image2, fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          icon: Icons.arrow_back,
                          containerColor: Colors.white,
                          iconColor: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        ),
                        const CustomIconButton(
                          icon: Icons.favorite_border_outlined,
                          containerColor: primaryColor,
                          iconColor: Colors.white, ),
                      ],
                    ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp. 3.500.000',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                              fontFamily: AssetsData.mainFont,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Harga per 8 jam',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontFamily: AssetsData.mainFont,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomElevatedButton(onPressed: (){}, text: 'Watch VR', width: MediaQuery.of(context).size.width * 0.3),

                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(AssetsData.person),
                          radius: 20.r,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengelola Lokasi',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                              fontFamily: AssetsData.mainFont,
                              ),
                            ),
                            Text(
                              'Jeremy Thomas Edison',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                              fontFamily: AssetsData.mainFont,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.call, color: Colors.white, size: 28.sp),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 5,),
                    SizedBox(height: 10.h),
                    Text(
                      'Tanggal Ketersediaan',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                      fontFamily: AssetsData.mainFont,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 1, 1),
                      calendarFormat: CalendarFormat.month,
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          size: 16.sp,
                          color: Colors.grey,
                        ),
                      ),
                      onDaySelected: (selectedDay, focusedDay) {

                      },
                    ),
                    const Divider(thickness: 5,),
                    SizedBox(height: 8.h),
                    Text(
                      'Deskripsi dan Spesifikasi',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                      fontFamily:  AssetsData.mainFont,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Spinning our wheels. Waste of resources. Vec call in the air support yet onward and fpward, productize the deliverables productize the deliverables products',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                      fontFamily: AssetsData.mainFont,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Luas',
                              style: TextStyle(fontSize: 14.sp,fontFamily: AssetsData.mainFont, color: Colors.grey),
                            ),
                            Text(
                              '1.000m2',
                              style: TextStyle(fontSize: 16.sp,fontFamily: AssetsData.mainFont, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tipe',
                              style: TextStyle(fontFamily: AssetsData.mainFont, fontSize: 14.sp, color: Colors.grey),
                            ),
                            Text(
                              'Gedung',
                              style: TextStyle(fontFamily: AssetsData.mainFont, fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(thickness: 5,),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
                          );
                        },
                        text: 'Book Now',
                        width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


