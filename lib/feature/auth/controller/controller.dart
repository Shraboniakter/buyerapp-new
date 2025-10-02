import 'package:get/get.dart';

class PhoneController extends GetxController {
  var phoneNumber = "".obs;   // Observable variable

  void setPhone(String number) {
    phoneNumber.value = number;
  }
}