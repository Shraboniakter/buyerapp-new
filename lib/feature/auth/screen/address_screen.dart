import 'package:buyerapp/core/global_widget/custom_elevatedbuttom.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:buyerapp/core/global_widget/custom_textfield.dart';
import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/feature/auth/controller/controller.dart';
import 'package:buyerapp/feature/auth/controller/dialog_controller.dart';
import 'package:buyerapp/feature/auth/controller/dropdown_controller.dart';
import 'package:buyerapp/feature/auth/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart' show IntlPhoneField;

class AddressScreen extends StatelessWidget {
  final DropdownController dropdownController = Get.put(DropdownController());
  final DialogController dialogController = Get.put(DialogController());

  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PhoneController phoneController = Get.put(PhoneController());
    return Scaffold(
      appBar: AppBar(
        title: CustomTextPoppins(
          text: "Profile setup",
          size: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextPoppins(
                text: "Full Name ",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 6),
              CustomTextfield(hintText: "Andrew Ainsley"),
              const SizedBox(height: 16),
              CustomTextPoppins(
                text: "Email",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 6),
              CustomTextfield(hintText: "abcd@gmail.com"),
              const SizedBox(height: 16),
              CustomTextPoppins(
                text: "Number",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 16),
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
                  phoneController.setPhone(phone.completeNumber);
                },
              ),
              const SizedBox(height: 16),
              CustomTextPoppins(
                text: "Address ",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 6),
              CustomTextfield(hintText: "Type Address"),
              const SizedBox(height: 16),
              CustomTextPoppins(
                text: "Shop Opening Time",
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 6),
              Obx(
                () => PopupMenuButton<String>(
                  onSelected: (String value) {
                    dropdownController.setSelectedItem(value);
                  },
                  position: PopupMenuPosition.under,
                  offset: const Offset(150, 0),
                  color: Color(0xffFFFFFF),
                  itemBuilder: (BuildContext context) {
                    return dropdownController.items.map((String item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Center(child: Text(item)),
                        ),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dropdownController.selectedItem.value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.unfold_more,
                          color: Colors.grey,
                        ), // double arrow
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 174),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButtom(
                  text: "CONTINUE",
                  onTap: () {
                      dialogController.showCustomDialog();
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
