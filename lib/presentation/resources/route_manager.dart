import 'package:flutter/material.dart';
import 'package:second_assingment/presentation/login/login.dart';
import 'package:second_assingment/presentation/main/main_screen.dart';
import 'package:second_assingment/presentation/onBoarding/on_boarding.dart';
import 'package:second_assingment/presentation/splash/splash.dart';
import 'package:second_assingment/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String forgortPasswordRoute = "/forgortPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('noRouteFound'),
              ),
              body: const Text('noRouteFound'),
            ));
  }
}
