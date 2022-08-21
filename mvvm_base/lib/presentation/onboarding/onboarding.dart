import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_base/presentation/onboarding/onboarding_view_model.dart';
import 'package:mvvm_base/presentation/resources/color_manager.dart';
import 'package:mvvm_base/presentation/resources/value_manager.dart';

import '../../domain/model.dart';
import '../resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnboardingViewModel _viewModel = OnboardingViewModel();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context,snapShot){
        return _getContentWidget(snapShot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
     if(sliderViewObject==null){
       return Container();
     }else{
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
           itemCount: sliderViewObject.numberOfSliders,
           onPageChanged: (index){
             _viewModel.onPageChange(index);
           },
           itemBuilder: (context, index){
             return OnboardingPage(sliderViewObject.sliderObject);
           },
         ),
         bottomSheet: Container(
           color: ColorManager.white,
           height: AppSize.s100,
           child: Column(
             children: [
               Align(
                 alignment: Alignment.centerRight,
                 child:
                 TextButton(
                   onPressed: (){

                   },
                   child: const Text(StringConstant.skip, textAlign: TextAlign.end,),),
               ),
               _getBottomSheetWidget(sliderViewObject),
             ],
           ),
         ),
       );
     }
  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.chevron_left),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.getPrevious(), duration: const Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
              },
            ),
          ),
          Row(
            children: [
              for(int i = 0; i < sliderViewObject.numberOfSliders; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(Icons.chevron_right),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.getNext(), duration: const Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int _currentIndex){
    if(index == _currentIndex){
      return const Icon(Icons.circle);
    }else{
      return const Icon(Icons.circle_outlined);
    }
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
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: AppSize.s60,),
        Image.asset(_sliderObject.image),

        // SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}