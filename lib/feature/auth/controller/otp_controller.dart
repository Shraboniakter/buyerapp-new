import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final RxInt start = 10.obs;
  Timer? _timer;

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  void resendCode() {
    if (start.value == 0) {
      start.value = 10;
      _startTimer();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
