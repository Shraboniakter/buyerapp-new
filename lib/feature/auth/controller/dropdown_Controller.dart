import 'package:get/get.dart';

class DropdownController extends GetxController {
  final RxString selectedItem = '7AM'.obs; // Changed to match items list
  final List<String> items = ['7AM', '8AM', '9AM'];

  String get selectedItemValue =>
      selectedItem.value; // Fixed typo in getter name

  void setSelectedItem(String? newValue) {
    if (newValue != null) {
      selectedItem.value = newValue;
    }
  }
}
