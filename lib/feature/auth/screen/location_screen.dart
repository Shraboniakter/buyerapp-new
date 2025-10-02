import 'package:buyerapp/core/global_widget/custom_elevatedbuttom.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/core/utils/assetpaths.dart';
import 'package:buyerapp/feature/auth/screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Image.asset(Assetpaths.ellipse),

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPoppins(
              text: "Home",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 3),
            CustomTextPoppins(
              text: "Belgachia, Kolkata.",
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(Assetpaths.frame),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 119.5),
          child: Column(
            children: [
              Image.asset(Assetpaths.frame2),
              SizedBox(height: 24),
              SizedBox(
                height: 48,
                width: 207,
                child: CustomElevatedButtom(
                  text: "ALLOW LOCATION",
                  onTap: () {
                    Get.to(() => AddressScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
