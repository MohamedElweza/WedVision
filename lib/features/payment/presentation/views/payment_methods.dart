import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedvision/features/payment/presentation/views/paymob_payment_screen.dart';
import 'package:wedvision/features/payment/presentation/views/paypal_payment_screen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method', style: TextStyle(fontSize: 22.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.payment, color: Colors.blue),
              title: Text('Pay with PayMob', style: TextStyle(fontSize: 18.sp)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayMobPaymentScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.green),
              title: Text('Pay with PayPal', style: TextStyle(fontSize: 18.sp)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayPalPaymentScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
