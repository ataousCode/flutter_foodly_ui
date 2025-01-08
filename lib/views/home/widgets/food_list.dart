import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/nearby_shimmer.dart';
import 'package:foodly/hooks/fetch_foods.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/views/home/widgets/food_widget.dart';
import 'package:get/get.dart';

import '../../food/food_page.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFecthFoods('41007428');
    List<Food>? foods = hookResults.data;
    final isLoanding = hookResults.isLoading;
    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoanding
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (index) {
                Food food = foods[index];
                return FoodWidget(
                  onTap: () {
                    Get.to(() => FoodPage(food: food));
                  },
                  image: food.imageUrl[0],
                  title: food.title,
                  time: food.time,
                  price: food.price.toStringAsFixed(2),
                );
              }),
            ),
    );
  }
}
