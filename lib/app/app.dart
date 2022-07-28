import 'package:flutter/material.dart';
import 'package:second_assingment/presentation/onBoarding/on_boarding.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:second_assingment/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

Route onboardingRoute =
    MaterialPageRoute(builder: (context) => const OnBoardingView());

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplictionTheme(),
    );
  }
}
