import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/global_widget/custom_textfield.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/feature/auth/controller/controller.dart';
import 'package:buyerapp/feature/auth/controller/dropdown_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart' show IntlPhoneField;

class AddressScreen extends StatelessWidget {
  final DropdownController controller = Get.put(DropdownController());

  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PhoneController controller = Get.put(PhoneController());
    return Scaffold(
      appBar: AppBar(
        title: CustomTextPoppins(
          text: "Profile setup",
          size: 16,
          fontWeight: FontWeight.w600,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPoppins(
              text: "Full Name ",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6),
            CustomTextfield(hintText: "Andrew Ainsley"),
            SizedBox(height: 16),
            CustomTextPoppins(
              text: "Email",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6),
            CustomTextfield(hintText: "abcd@gmail.com"),
            SizedBox(height: 16),
            CustomTextPoppins(
              text: "Number",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 16),
            IntlPhoneField(
              decoration: InputDecoration(
                hintText: " +966 4578 9654",
                hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey1,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.white,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
              ),
              initialCountryCode: 'BD',
              onChanged: (phone) {
                controller.setPhone(phone.completeNumber);
              },
            ),
            CustomTextPoppins(
              text: "Address ",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6),
            CustomTextfield(hintText: "Type Address"),

            SizedBox(height: 16),
            CustomTextPoppins(
              text: "Shop Opening Time",
              size: 14,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 6),
            Obx(
              () => DropdownButton<String>(
                value: DropdownController().selectedItem.value,
                items: DropdownController().items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  DropdownController().setSelectedItem(newValue);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
