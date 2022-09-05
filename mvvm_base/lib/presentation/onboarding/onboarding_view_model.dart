import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_base/presentation/base/baseViewModel.dart';

import '../../domain/model/model.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInput, OnboardingViewModelOutput{
final StreamController _streamController = StreamController<SliderViewObject>();
late final List<SliderObject> _list;
int _currentIndex = 0;

  // input
  @override
  void dispose() {
    _streamController.close();
  }

  // output
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int getNext() {
    int nextIndex = _currentIndex ++;
    if(nextIndex >= _list.length){
      _currentIndex = 0;
    }

    return _currentIndex;
  }

  @override
  int getPrevious() {
    int previousIndex = _currentIndex --;
    if(previousIndex == -1){
      _currentIndex = _list.length -1;
    }

    return _currentIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;


  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);
  List<SliderObject> _getSliderData() => [
    SliderObject(StringConstant.onBoardingTitle1, StringConstant.onBoardingSubTitle1, ImageAssets.appreciation ),
    SliderObject(StringConstant.onBoardingTitle2, StringConstant.onBoardingSubTitle2, ImageAssets.love ),
    SliderObject(StringConstant.onBoardingTitle3, StringConstant.onBoardingSubTitle3, ImageAssets.pure_love ),
    SliderObject(StringConstant.onBoardingTitle4, StringConstant.onBoardingSubTitle4, ImageAssets.buddies ),
  ];

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// view model will receive from view
abstract class OnboardingViewModelInput {
  void getNext(); // when user click or swipe left
  void getPrevious(); // when user click or swipe right
  void onPageChange(int index);

  Sink get inputSliderViewObject; // stream input
}

// data or result that will be sent ftom our view model to our view
abstract class OnboardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject{
  SliderObject sliderObject;
  int numberOfSliders;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSliders, this.currentIndex);

}