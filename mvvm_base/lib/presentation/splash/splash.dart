import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_base/presentation/resources/color_manager.dart';
import 'package:mvvm_base/presentation/resources/routes_manager.dart';

import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay(){
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.navyBlue,
      body: const Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo),),
      )
    );
  }
}
