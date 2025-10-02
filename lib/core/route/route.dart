import 'package:buyerapp/feature/auth/screen/address_screen.dart';
import 'package:buyerapp/feature/auth/screen/location_screen.dart';
import 'package:buyerapp/feature/auth/screen/otp_screen.dart';
import 'package:get/get.dart';
import 'package:buyerapp/feature/splash/screen/splash_screen.dart';
import 'package:buyerapp/feature/auth/screen/login_or_signup_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String location = '/location';
  static const String address = '/address';

  final List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginOrSignupScreen()),
    GetPage(name: otp, page: () => OtpScreen()),
    GetPage(name: location, page: () => LocationScreen()),
    GetPage(name: address, page: () => AddressScreen()),
  ];
}
