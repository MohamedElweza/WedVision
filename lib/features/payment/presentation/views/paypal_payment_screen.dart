import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class PayPalPaymentScreen extends StatefulWidget {
  const PayPalPaymentScreen({super.key});

  @override
  _PayPalPaymentScreenState createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
  String paypalClientId = 'YOUR_PAYPAL_CLIENT_ID';
  String paypalSecret = 'YOUR_PAYPAL_SECRET';
  String paypalUrl = 'https://api.sandbox.paypal.com'; // Use sandbox for testing

  Future<void> initiatePayPalPayment() async {
    try {
      var authResponse = await http.post(
        Uri.parse('$paypalUrl/v1/oauth2/token'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic ' + base64Encode(utf8.encode('$paypalClientId:$paypalSecret')),
        },
        body: 'grant_type=client_credentials',
      );

      var authData = jsonDecode(authResponse.body);
      String accessToken = authData['access_token'];

      var paymentResponse = await http.post(
        Uri.parse('$paypalUrl/v1/payments/payment'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          "intent": "sale",
          "redirect_urls": {
            "return_url": "https://example.com/return",
            "cancel_url": "https://example.com/cancel"
          },
          "payer": {
            "payment_method": "paypal"
          },
          "transactions": [
            {
              "amount": {
                "total": "10.00",
                "currency": "USD"
              },
              "description": "This is the payment transaction description."
            }
          ]
        }),
      );

      var paymentData = jsonDecode(paymentResponse.body);
      String approvalUrl = paymentData['links'][1]['href'];

      if (await canLaunch(approvalUrl)) {
        await launch(approvalUrl);
      } else {
        throw 'Could not launch $approvalUrl';
      }
    } catch (e) {
      print(e);
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    initiatePayPalPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with PayPal', style: TextStyle(fontSize: 22.sp)),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Redirecting to PayPal...'),
      ),
    );
  }
}
