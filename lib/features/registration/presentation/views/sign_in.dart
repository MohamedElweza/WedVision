import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wedvision/constants.dart';
import 'package:wedvision/features/registration/presentation/views/phone_auth.dart';
import 'package:wedvision/features/registration/presentation/views/sign_up.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  final Duration duration = const Duration(milliseconds: 800);
  final _authService = AuthService();

  Future<void> _handleGoogleSignIn() async {

    setState(() {
      _isLoading = true;
    });
    final user = await _authService.signInWithGoogle();
    setState(() {
      _isLoading = false;
    });
    if (user != null) {
      Fluttertoast.showToast(
        msg: 'Successfully authenticated with Google',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Navigate to home screen if successful
    } else {
      Fluttertoast.showToast(
        msg: 'Google sign-in failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  Future<void> _signIn() async {

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      Navigator.pushNamed(context, '/signUp');
      // Navigate to home screen if successful
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
              fontFamily: 'MainFont',
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
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.bold,
                ), ),
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
          leading: Container(),
            centerTitle: true,
            elevation: 10,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            title: const Text('Sign In', style: TextStyle(
          color: Colors.black,
          fontFamily: 'MainFont',
          fontWeight: FontWeight.bold,
        ),)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                CustomTextField(nameController: _emailController, label: 'Email', hint: 'Enter Your Email', secure: false,),
                SizedBox(height: 20.h),
                CustomTextField(nameController: _passwordController, label: 'Password', hint: 'Enter Your Password', secure: true,),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: Size(MediaQuery.of(context).size.width/2, 60.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Sign In', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'MainFont',
                      ),),
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Don’t have an account?', style: TextStyle(
                          fontFamily: 'MainFont',
                          color: Colors.grey,
                        ),),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signUp');
                                              },
                          child: Text('SIGN UP', style: TextStyle(
                            color: primaryColor,
                            fontFamily: 'MainFont',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height:  70.h),
                Column(
                  children:  [
                    /// GOOGLE BTN
                    Column(
                      children: [
                        FadeInUp(
                          duration: duration,
                          delay: const Duration(milliseconds: 600),
                          child: ElevatedButton(
                            onPressed: _handleGoogleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.login, color: Colors.white,),

                                SizedBox(width: 15.w,),

                                Text(
                                  'Sign Up with Google', style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MainFont',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ),
                        ),
      
                        SizedBox(
                          height: 20.h,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
                          child: FadeInUp(
                            duration: duration,
                            delay: const Duration(milliseconds: 200),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const PhoneSignUpScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone, color: Colors.white,),
                                  SizedBox(width: 15.w,),
                                  Text(
                                    'Sign Up with Phone', style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MainFont',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
          credential);
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
