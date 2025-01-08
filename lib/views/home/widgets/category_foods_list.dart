import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_category_foods.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';

import '../../../models/foods_model.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFecthFoodsByCategories('41007428');
    List<Food>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const FoodsListShimmer()
          : foods == null || foods.isEmpty
              ? const Center(
                  child: Text('No foods found'),
                )
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    //scrollDirection: Axis.horizontal,
                    children: List.generate(
                      foods.length,
                      (index) {
                        Food food = foods[index];
                        return FoodTile(color: Colors.white, food: food);
                      },
                    ),
                  ),
                ),
    );
  }
}
