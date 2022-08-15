import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_base/presentation/resources/assets_manager.dart';
import 'package:mvvm_base/presentation/resources/color_manager.dart';
import 'package:mvvm_base/presentation/resources/value_manager.dart';

import '../resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject>_getSliderData() => [
    SliderObject(StringConstant.onBoardingTitle1, StringConstant.onBoardingSubTitle1, ImageAssets.appreciation ),
    SliderObject(StringConstant.onBoardingTitle2, StringConstant.onBoardingSubTitle2, ImageAssets.love ),
    SliderObject(StringConstant.onBoardingTitle3, StringConstant.onBoardingSubTitle3, ImageAssets.pure_love ),
    SliderObject(StringConstant.onBoardingTitle4, StringConstant.onBoardingSubTitle4, ImageAssets.buddies ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index){
          // return _list[index];
          return OnboardingPage(_list[index]);
        },
      ),
      // bottomSheet: ,
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60,),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}


class SliderObject{
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
