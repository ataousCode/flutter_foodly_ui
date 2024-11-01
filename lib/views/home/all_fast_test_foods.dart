import 'package:flutter/material.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

class AllFastTestFoods extends StatelessWidget {
  const AllFastTestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'Fastest foods',
          style: appStyle(13, kGray, FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text('All fast test Restaurants'),
      ),
    );
  }
}
