import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 35.w,
                      child: const CircleAvatar(
                        backgroundColor: kGrayLight,
                        backgroundImage: AssetImage('assets/images/atalib.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: "Almousleck",
                              style: appStyle(12, kGray, FontWeight.w600)),
                          ReusableText(
                              text: "almousleck@ studio.com",
                              style: appStyle(10, kGray, FontWeight.normal)),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Feather.edit,
                      color: kGray,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
