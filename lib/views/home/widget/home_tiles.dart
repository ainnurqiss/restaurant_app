import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:restaurant_foodly/common/home_tile.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/add_foods/add_foods.dart';
import 'package:restaurant_foodly/views/food/food_list.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 65.h,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeTile(
            onTap: () {
              Get.to(
                () => const AddFoods(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900),
              );
            },
            text: "Add Foods",
            iconPath: "assets/icons/tacos.svg",
          ),
          HomeTile(
            onTap: () {},
            text: "Wallet",
            iconPath: "assets/icons/wallet.svg",
          ),
          HomeTile(
            onTap: () {
              Get.to(
                () => const FoodList(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900),
              );
            },
            text: "Foods",
            iconPath: "assets/icons/foods.svg",
          ),
          HomeTile(
            onTap: () {},
            text: "Self Deliveries",
            iconPath: "assets/icons/deliveries.svg",
          ),
        ],
      ),
    );
  }
}
