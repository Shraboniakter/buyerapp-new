import 'package:get/get.dart';

class DropdownController extends GetxController {
  final RxString selectedItem = '6AM'.obs;
  final List<String> items = ['7AM', '8AM', 'Option 3'];

  String get selteitm => selectedItem.value;

  void setSelectedItem(String? newValue) {
    if (newValue != null) {
      selectedItem.value = newValue;
    }
  }
}
