import 'package:buyerapp/core/global_widget/custom_elevatedbuttom.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/feature/auth/controller/otp_controller.dart';
import 'package:buyerapp/feature/auth/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OTPController controller = Get.put(OTPController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                CustomTextPoppins(
                  text: "Enter OTP",
                  size: 20,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 16),
                CustomTextPoppins(
                  text: "Enter OTP send your number",
                  size: 14,
                  color: AppColors.grey1,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 32),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.phone,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60.6,
                    activeFillColor: AppColors.neutrals,
                    inactiveFillColor: const Color(0xffFBFDFA),
                    inactiveColor: AppColors.neutrals,
                    selectedFillColor: AppColors.neutrals,
                    borderWidth: 1,
                    selectedColor: const Color(0xffFBFDFA),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  appContext: context,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextPoppins(
                      text: "Didn't receive the code?",
                      size: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomTextPoppins(
                      text: "Resend code",
                      size: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomTextPoppins(
                  text: "Resend code at 00:59",
                  size: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 470),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtom(
                    text: "CONTINUE",
                    onTap: () {
                      Get.to(() => LocationScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
