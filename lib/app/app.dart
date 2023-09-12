import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/app_binding.dart';
import 'package:quiz_app/app/data/values/constants.dart';
import 'package:quiz_app/app/data/values/env.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:quiz_app/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.title,
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
