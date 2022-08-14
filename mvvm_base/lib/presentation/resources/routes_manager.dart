import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_base/presentation/forgot_password/forgot_password.dart';
import 'package:mvvm_base/presentation/login/login.dart';
import 'package:mvvm_base/presentation/main/main_view.dart';
import 'package:mvvm_base/presentation/onboarding/onboarding.dart';
import 'package:mvvm_base/presentation/register/register.dart';
import 'package:mvvm_base/presentation/resources/strings_manager.dart';
import 'package:mvvm_base/presentation/splash/splash.dart';
import 'package:mvvm_base/presentation/store_details/store_details.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator{
  static Route<dynamic>? getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
      Scaffold(
        appBar: AppBar(title: const Text(StringConstant.no_route_found),),
        body: const Text(StringConstant.no_route_found),
      )
    );
  }
}