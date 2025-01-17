// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:get/get.dart';

import '../../../common/custom_button.dart';
import '../../../constants/constants.dart';
import '../rating_page.dart';
class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.restaurant,
  });

  final Restaurants restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          topLeft: Radius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemSize: 25,
            itemCount: 5,
            rating: restaurant.rating.toDouble(),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
          CustomButton(
            onTap: () {
              Get.to(() => const RatingPage());
            },
            btnColor: kSecondary,
            btnWidth: width / 3,
            text: 'Rate Restaurant',
          ),
        ],
      ),
    );
  }
}
