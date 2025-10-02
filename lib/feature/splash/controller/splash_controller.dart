import 'package:buyerapp/feature/auth/screen/login_or_signup_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    print("============>>>timer is on");
    super.onInit();
    _goToNextScreen();
  }

  void _goToNextScreen() async {
    await Future.delayed(Duration(seconds: 5), () {
      print("============>>>timer end");
      Get.off(() => LoginOrSignupScreen());
    });
  }
}
