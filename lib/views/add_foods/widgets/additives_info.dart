import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/app_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_textfield.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../controllers/food_controller.dart';

class AdditivesInfo extends StatelessWidget {
  const AdditivesInfo({
    super.key,
    required this.additiveTitle,
    required this.additivePrice,
  });

  final TextEditingController additiveTitle;
  final TextEditingController additivePrice;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FoodController>();

    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Additives",
                  style: appStyle(14, kGray, FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: additiveTitle,
                  hintText: "Additive Title",
                  prefixIcon: Icon(Icons.label),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: additivePrice,
                  hintText: "Additive Price",
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.money),
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  text: "Add",
                  onTap: () {
                    final title = additiveTitle.text.trim();
                    final price = double.tryParse(additivePrice.text.trim());

                    if (title.isNotEmpty && price != null) {
                      controller.addAdditive(title: title, price: price);
                      additiveTitle.clear();
                      additivePrice.clear();
                    } else {
                      Get.snackbar(
                        "Invalid Input",
                        "Please enter valid title and numeric price",
                        backgroundColor: kPrimary,
                        colorText: LightWhite,
                      );
                    }
                  },
                ),
                SizedBox(height: 20.h),
                ReusableText(
                  text: "Your Additives",
                  style: appStyle(13, kPrimary, FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => Column(
                    children:
                        controller.additives.map((additive) {
                          return ListTile(
                            leading: Icon(Icons.check_circle, color: kPrimary),
                            title: Text(additive.title),
                            trailing: Text(
                              "RM ${additive.price.toStringAsFixed(2)}",
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
