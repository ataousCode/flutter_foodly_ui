import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../common/custom_button.dart';
import 'login_page.dart';
import 'widget/email_textfield.dart';
import 'widget/password_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernamelController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernamelController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: 'Foodly',
            style: appStyle(
              18,
              kLightWhite,
              FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h),
              Lottie.asset('assets/anime/delivery.json'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    EmailTextfield(
                      hintText: 'Username',
                      prefixIcon: const Icon(
                        CupertinoIcons.person,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _usernamelController,
                    ),
                    SizedBox(height: 15.h),
                    EmailTextfield(
                      hintText: 'Email',
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(height: 15.h),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(
                      text: 'REGISTER',
                      onTap: () {},
                      btnHeight: 35.h,
                      btnWidth: width,
                    ),
                    //SizedBox(height: 25.h),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: 'Have an account?',
                            style: appStyle(12, kGray, FontWeight.w500),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const LoginPage(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900),
                              );
                            },
                            child: ReusableText(
                              text: 'Login',
                              style: appStyle(12, Colors.blue, FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
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
