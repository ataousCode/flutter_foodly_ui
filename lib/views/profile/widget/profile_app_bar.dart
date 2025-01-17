import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          //todo: logout function
        },
        child: Icon(
          AntDesign.logout,
          size: 18.h,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/ml.svg',
                  width: 15.w,
                  height: 25.h,
                ),
                SizedBox(width: 5.w),
                Container(
                  width: 1.w,
                  height: 15.h,
                  color: kGrayLight,
                ),
                SizedBox(width: 5.w),
                ReusableText(
                  text: 'MALI',
                  style: appStyle(16, kDark, FontWeight.normal),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    //todo: open settings
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Icon(SimpleLineIcons.settings, size: 18.h),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
