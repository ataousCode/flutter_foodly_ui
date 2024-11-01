import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';

class AllNearByRestaurants extends StatelessWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: 'Nearby restaurants',
            style: appStyle(13, kGray, FontWeight.w600),
          ),
        ),
        body: BackGroundContainer(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: ListView(
              //scrollDirection: Axis.horizontal,
              children: List.generate(restaurants.length, (index) {
                var restaurant = restaurants[index];
                return RestaurantTile(
                  restaurant: restaurant,
                );
              }),
            ),
          ),
        ));
  }
}
