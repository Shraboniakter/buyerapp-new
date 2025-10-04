import 'dart:async';

import 'package:buyerapp/core/global_widget/custom_elevatedbuttom.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/feature/auth/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 59;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
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
                    GestureDetector(
                      onTap: () {
                        if (_start == 0) {
                          setState(() {
                            _start = 60;
                            _startTimer();
                          });
                        }
                      },
                      child: CustomTextPoppins(
                        text: "Resend code",
                        size: 14,
                        color: _start !=0 ? AppColors.grey : AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomTextPoppins(
                  text:
                      "Resend code at 00:${_start.toString().padLeft(2, '0')}",
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
