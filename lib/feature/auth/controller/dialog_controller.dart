import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:buyerapp/core/utils/assetpaths.dart';

class DialogController extends GetxController {
  /// প্রথম Success Dialog
  void showCustomDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Local image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Assetpaths.group,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  CustomTextPoppins(
                    text: "Successfully!",
                    size: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 8),
                  CustomTextPoppins(
                    text:
                        "Your account is ready to use. You will be redirected to the home page in a few seconds",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 24),

              // CircularProgressIndicator
              SpinKitCircle(
                color: AppColors.green,
                size: 50.0,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );

    // ৪ সেকেন্ড পরে প্রথম dialog বন্ধ + Home page
    Future.delayed(Duration(seconds: 4), () {
      Get.back(); // Close success dialog
      Get.offAllNamed('/homepageone'); // Navigate to home page

      // ৫০০ms পরে দ্বিতীয় dialog দেখাবে
      Future.delayed(Duration(milliseconds: 500), () {
        showImageDialog();
      });
    });
  }

  /// দ্বিতীয় Dialog (335x501, radius 16px)
  void showImageDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 335,
            height: 501,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                // Full Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assetpaths.frame4, // তোমার frame4 image
                    width: 335,
                    height: 501,
                    fit: BoxFit.cover, // পুরো box cover হবে
                  ),
                ),

                // Close Button
                Positioned(
                  right: 8,
                  top: 8,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.close, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false, // কেবল close button দিয়ে বন্ধ হবে
    );
  }
}
