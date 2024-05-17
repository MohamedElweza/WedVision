import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class PayMobPaymentScreen extends StatefulWidget {
  const PayMobPaymentScreen({super.key});

  @override
  _PayMobPaymentScreenState createState() => _PayMobPaymentScreenState();
}

class _PayMobPaymentScreenState extends State<PayMobPaymentScreen> {
  String paymobApiKey = 'YOUR_PAYMOB_API_KEY';
  String integrationId = 'YOUR_INTEGRATION_ID';
  String iframeId = 'YOUR_IFRAME_ID';
  String paymobOrderID = '';
  String paymobPaymentKey = '';

  Future<void> initiatePayMobPayment() async {
    try {
      // Authentication Request
      var authResponse = await http.post(
        Uri.parse('https://accept.paymobsolutions.com/api/auth/tokens'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'api_key': paymobApiKey,
        }),
      );

      var authData = jsonDecode(authResponse.body);
      String token = authData['token'];

      // Create Order
      var orderResponse = await http.post(
        Uri.parse('https://accept.paymobsolutions.com/api/ecommerce/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'auth_token': token,
          'delivery_needed': 'false',
          'amount_cents': '1000',
          'currency': 'EGP',
          'items': [],
        }),
      );

      var orderData = jsonDecode(orderResponse.body);
      setState(() {
        paymobOrderID = orderData['id'].toString();
      });

      // Payment Key Request
      var paymentKeyResponse = await http.post(
        Uri.parse('https://accept.paymobsolutions.com/api/acceptance/payment_keys'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'auth_token': token,
          'amount_cents': '1000',
          'expiration': 3600,
          'order_id': paymobOrderID,
          'billing_data': {
            'apartment': '803',
            'email': 'example@domain.com',
            'floor': '42',
            'first_name': 'FirstName',
            'street': 'Street',
            'building': 'Building',
            'phone_number': '+201234567890',
            'shipping_method': 'PKG',
            'postal_code': '12345',
            'city': 'City',
            'country': 'Country',
            'last_name': 'LastName',
            'state': 'State'
          },
          'currency': 'EGP',
          'integration_id': integrationId,
        }),
      );

      var paymentKeyData = jsonDecode(paymentKeyResponse.body);
      setState(() {
        paymobPaymentKey = paymentKeyData['token'];
      });

      // Redirect to PayMob Payment Page
      String paymentUrl = 'https://accept.paymob.com/api/acceptance/iframes/$iframeId?payment_token=$paymobPaymentKey';
      if (await canLaunch(paymentUrl)) {
        await launch(paymentUrl);
      } else {
        throw 'Could not launch $paymentUrl';
      }
    } catch (e) {
      print(e);
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    initiatePayMobPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with PayMob', style: TextStyle(fontSize: 22.sp)),
        centerTitle: true,
      ),
      body: Center(
        child: paymobPaymentKey.isEmpty
            ? const CircularProgressIndicator()
            : const Text('Redirecting to PayMob...'),
      ),
    );
  }
}
