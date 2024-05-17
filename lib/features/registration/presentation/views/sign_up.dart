import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wedvision/constants.dart';
import 'package:wedvision/core/utils/assets.dart';
import 'package:wedvision/features/registration/presentation/views/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signUp() async {

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await userCredential.user?.updateDisplayName(_nameController.text);

      Fluttertoast.showToast(
        msg: 'Successfully registered',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacementNamed(context, signInScreen);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error', style: TextStyle(
              color: Colors.black,
              fontFamily: AssetsData.mainFont,
              fontWeight: FontWeight.bold,
            ),),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(
                  color: Colors.black,
                  fontFamily: AssetsData.mainFont,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainBackGroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: primaryColor,),),
            centerTitle:  true,
            elevation: 5,
            surfaceTintColor: Colors.white,
            title: const Text(
              'Sign Up', style: TextStyle(
          color: Colors.black,
          fontFamily: 'MainFont',
          fontWeight: FontWeight.bold,
        ),)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomTextField(nameController: _nameController, label: 'Name', hint: 'Enter Your Name', secure: false,),
                SizedBox(height: 20.h),
                CustomTextField(nameController: _emailController, label: 'Email', hint: 'Enter Your Email', secure: false,),
                SizedBox(height: 20.h),
                CustomTextField(nameController: _phoneController, label: 'Phone', hint: 'Enter Your Phone', secure: false,),
                SizedBox(height: 20.h),
                CustomTextField(nameController: _passwordController, label: 'Password', hint: 'Enter Your Password', secure: true,),
                SizedBox(height: 40.h),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Sign Up', style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'MainFont',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(color: primaryColor,),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
