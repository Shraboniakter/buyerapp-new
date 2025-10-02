import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:buyerapp/core/binding/binding.dart';
import 'package:buyerapp/core/route/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (__, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Buyer App',
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes().pages,
          initialBinding: AppBinding(),
        );
      },
    );
  }
}
