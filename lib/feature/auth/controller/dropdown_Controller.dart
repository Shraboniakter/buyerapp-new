import 'package:get/get.dart';

// Controller
class DropdownController extends GetxController {
  var items = ["6AM", "7AM", "8AM", "9AM"].obs;
  var selectedItem = "6AM".obs;

  void setSelectedItem(String? value) {
    if (value != null) {
      selectedItem.value = value;
    }
  }
}
