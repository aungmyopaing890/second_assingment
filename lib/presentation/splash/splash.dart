import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_assingment/presentation/resources/assets_manager.dart';
import 'package:second_assingment/presentation/resources/color_manager.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');
    var duration = const Duration(seconds: 3);
    if (firstTime != null && !firstTime) {
      // Not first time
      return Timer(duration, navigationPagLogin);
    } else {
      // First time
      prefs.setBool('first_time', false);
      return Timer(duration, navigationPagLogin);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
  }

  void navigationPageWel() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  void navigationPagLogin() {
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:
          const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}
