import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_flutter/common/app_style.dart';
import 'package:restaurant_flutter/common/custom_button.dart';
import 'package:restaurant_flutter/common/reusable_text.dart';
import 'package:restaurant_flutter/constants/constants.dart';
import 'package:restaurant_flutter/controllers/uploader_controller.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});

  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 12.h, top: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Upload Images",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                      "You are required to upload at least 2 images to proceed",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image One
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('one');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                controller.imageOneUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        controller.imageOneUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),

                      // Image Two
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('two');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                controller.imageTwoUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        controller.imageTwoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image Three
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('three');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                controller.imageThreeUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        controller.imageThreeUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),

                      // Image Four
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('four');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                controller.imageFourUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        controller.imageFourUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "Back",
                        btnWidth: width / 2.3,
                        btnRadius: 9,
                        onTap: () {
                          back();
                        },
                      ),
                      CustomButton(
                        text: "Next",
                        btnWidth: width / 2.3,
                        btnRadius: 9,
                        onTap: () {
                          next();
                          // if (controller.images.length > 1) {
                          //   next();
                          // } else {
                          //   Get.snackbar(
                          //     colorText: kLightWhite,
                          //     backgroundColor: kPrimary,
                          //     snackPosition: SnackPosition.TOP,
                          //     "Upload required images",
                          //     "Please upload at least 2 images",
                          //   );
                          // }
                        },
                      ),
                    ],
                  ),
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
