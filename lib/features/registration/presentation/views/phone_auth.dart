import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wedvision/core/utils/assets.dart';

import '../../../../constants.dart';

class PhoneSignUpScreen extends StatefulWidget {
  const PhoneSignUpScreen({super.key});


  @override
  State<PhoneSignUpScreen> createState() => _PhoneSignUpScreenState();
}

class _PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isLoading = false;
  String? _verificationId;

  Future<void> _sendOtp() async {
    setState(() {
      _isLoading = true;
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20' + _phoneController.text, // Egyptian country code
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Fluttertoast.showToast(msg: 'Phone number automatically verified and user signed in.');
        setState(() {
          _isLoading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(msg: e.message ?? 'Verification failed');
        setState(() {
          _isLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        Fluttertoast.showToast(msg: 'OTP sent to your phone');
        setState(() {
          _verificationId = verificationId;
          _isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    final code = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: code,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Fluttertoast.showToast(msg: 'Successfully signed in with phone number');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to sign in, Please try again.');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: primaryColor,),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          elevation: 5,
          title: Text('Phone Verification', style: TextStyle(
            color: Colors.black,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsData.phone, height: 300.h, width: double.infinity,),
          SizedBox(height: 20.h),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '123 456 7890', // without country code
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: _sendOtp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Verify', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'MainFont',
                      ),),
                  ),
                  SizedBox(height: 20.h),
                  if (_verificationId != null) ...[
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      onChanged: (value) {},
                      controller: _otpController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50.h,
                        fieldWidth: 40.w,
                        activeFillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: _verifyOtp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: const Text('Verify Code', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MainFont',
                      ),),
                    ),
                  ],
                ],
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
