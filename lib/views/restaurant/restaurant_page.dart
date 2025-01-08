import 'package:flutter/material.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/models/restaurants_model.dart';

import '../../common/app_style.dart';
import '../../constants/constants.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final Restaurants? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'Restaurants',
          style: appStyle(17, kGray, FontWeight.w600),
        ),
      ),
      body: Container(),
    );
  }
}
