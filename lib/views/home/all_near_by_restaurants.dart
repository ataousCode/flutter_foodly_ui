import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_all_restaurants.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';

class AllNearByRestaurants extends HookWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFecthAllRestaurants('41007428');
    List<Restaurants>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
        backgroundColor: kOffWhite,
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
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    //scrollDirection: Axis.horizontal,
                    children: List.generate(restaurants!.length, (index) {
                      Restaurants restaurant = restaurants[index];
                      return RestaurantTile(
                        restaurant: restaurant,
                      );
                    }),
                  ),
                ),
        ));
  }
}
