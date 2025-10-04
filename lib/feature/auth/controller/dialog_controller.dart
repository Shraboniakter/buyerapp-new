import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:buyerapp/core/utils/assetpaths.dart';

class DialogController extends GetxController {
 
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
              Column(children: [
                CustomTextPoppins(text: "Successfully!",size: 20,fontWeight: FontWeight.w600,),
                SizedBox(height: 8),
                CustomTextPoppins(text: "Your account is ready to use. You will be redirected to the home page in a few seconds",size: 14,fontWeight: FontWeight.w400,color: AppColors.grey,
                textAlign: TextAlign.center,
                ),

              ],),
           
              SizedBox(height: 24),

              // CircularProgressIndicator
              SpinKitCircle(
                color:AppColors.green,
                size: 50.0,
              ),
              SizedBox(height: 20),

              
            ],
          ),
        ),
      ),
      barrierDismissible: true, 
    );
    Future.delayed(Duration(seconds: 4), () {
      Get.back(); // Close the dialog
      Get.offAllNamed('/homepageone'); // Navigate to home page
    });
  }
}
