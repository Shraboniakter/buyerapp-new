import 'package:buyerapp/feature/auth/controller/controller.dart';
import 'package:get/get.dart';
import 'package:buyerapp/feature/splash/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(PhoneController());
  }
}
