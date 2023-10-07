// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:juridentt/authentication/forget_password/forgetpassword.dart';
import 'package:juridentt/constants.dart';
import 'package:juridentt/resources/auth.dart';
import 'package:sizer/sizer.dart';

class LoginScreenClient extends StatefulWidget {
  const LoginScreenClient({Key? key}) : super(key: key);

  @override
  State<LoginScreenClient> createState() => _LoginScreenClientState();
}

class _LoginScreenClientState extends State<LoginScreenClient> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool keepLoggedIn = true;

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _loseFocus() {
    _focusNode1.unfocus();
    _focusNode2.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final height = size.height;
    // final width = size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(201, 159, 74, 0.54),
        backgroundColor: Constants.orange,
        // extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/ellipse.png',
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 35.w, right: 35.w, top: 30.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Welcome to Jurident",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: Constants.satoshiYellowNormal22),
                        Container(
                          width: 358.w,
                          margin: EdgeInsets.only(top: 17.h),
                          child: Text(
                              "Are you ready to become a legal eagle? Login to the app and spread your wings in the courtroom.",
                              maxLines: null,
                              textAlign: TextAlign.justify,
                              style: Constants.satoshiBlackNormal18),
                        ),
                        Container(
                          height: 464.h,
                          width: 440.w,
                          margin: EdgeInsets.only(top: 30.h),
                          padding: EdgeInsets.only(
                              left: 29.w, right: 20.w, bottom: 31.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constants.white,
                            border: Border.all(
                              color: Constants.black33,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Constants.black4c,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 160.h),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Log In",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: Constants
                                                .satoshiTransparentNormal22Underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/clientsignup');
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 28.w, bottom: 2.w),
                                        child: Text(
                                          "Sign Up",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: Constants
                                              .satoshiLightBlackNormal22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -100.0, 0.0),
                                child: TextFormField(
                                  focusNode: _focusNode1,
                                  onEditingComplete: _loseFocus,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    contentPadding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 16.h,
                                      right: 7.w,
                                      bottom: 16.h,
                                    ),
                                    prefixIcon: Container(
                                      margin: EdgeInsets.only(
                                        left: 10.w,
                                        top: 16.h,
                                        right: 7.w,
                                        bottom: 16.h,
                                      ),
                                      child: Image.asset(
                                        'assets/images/mailsymbol.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Constants.black,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Constants.black,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    // Regular expression for email validation
                                    final emailRegex = RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null; // Return null to indicate no validation errors
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -100.0, 0.0),
                                child: TextFormField(
                                  focusNode: _focusNode2,
                                  onEditingComplete: _loseFocus,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    contentPadding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 16.h,
                                      right: 7.w,
                                      bottom: 16.h,
                                    ),
                                    prefixIcon: Container(
                                      margin: EdgeInsets.only(
                                        left: 10.w,
                                        top: 16.h,
                                        right: 7.w,
                                        bottom: 16.h,
                                      ),
                                      child: Image.asset(
                                        'assets/images/passwordlock.png',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Constants.black,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: BorderSide(
                                        color: Constants.black,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                transform:
                                    Matrix4.translationValues(0.0, -60.0, 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 21.h,
                                      width: 21.w,
                                      decoration: BoxDecoration(
                                        color: Constants.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Checkbox(
                                        value: keepLoggedIn,
                                        onChanged: (value) {
                                          setState(() {
                                            keepLoggedIn = value!;
                                          });
                                        },
                                        activeColor: Constants.blue,
                                        checkColor: Constants.white,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.w, top: 2.h),
                                      child: Text(
                                        "Keep me Logged In",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: Constants.satoshiYellow14,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgetPassword(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 20.h,
                                        width: 115.w,
                                        margin: EdgeInsets.only(
                                            left: 9.w, top: 2.h),
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                width: 115.w,
                                                child: Divider(
                                                  height: 2,
                                                  thickness: 2,
                                                  color: Constants.yellow,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                "Forgot Password?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style:
                                                    Constants.satoshiYellow14,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                  }
                                  Navigator.pushNamed(
                                    context,
                                    '/clientloginotp',
                                    arguments: {
                                      'useremail': emailController.text,
                                      'userpassword': passwordController.text,
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.lightblack,
                                  minimumSize: Size(320.w, 50.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "Send OTP",
                                  style: Constants.satoshiWhite18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 6.h),
                              child: SizedBox(
                                width: 149.w,
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Constants.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7.w),
                              child: const Text(
                                "or",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14.h, bottom: 6.h),
                              child: SizedBox(
                                width: 149.w,
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Constants.black,
                                  indent: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h, left: 135.w),
                          child: Text(
                            "Log In with",
                            style: Constants.satoshiGrey90016,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 13.h, bottom: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Auth().signInWithFacebookClient(context);
                                },
                                child: Image.asset(
                                  'assets/images/facebook_logo.png',
                                  width: 45.w,
                                  height: 45.h,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Auth().signInWithGoogleClient(context);
                                  },
                                  child: Image.asset(
                                    'assets/images/google_logo.png',
                                    width: 48.w,
                                    height: 48.h,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 50.w, top: 4.h, bottom: 4.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Auth().signInWithTwitterClients(context);
                                  },
                                  child: Image.asset(
                                    'assets/images/twitter_logo.png',
                                    width: 36.w,
                                    height: 45.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
