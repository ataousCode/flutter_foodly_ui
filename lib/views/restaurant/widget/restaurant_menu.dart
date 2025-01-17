import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/food_by_restaurant.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFecthRestaurantFoods(restaurantId);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? const FoodsListShimmer()
          : foods == null || foods.isEmpty
              ? Center(
                  child: Text(
                    'No food items available.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final Food food = foods[index];
                      return FoodTile(food: food);
                    },
                  ),
                ),
    );
  }
}
