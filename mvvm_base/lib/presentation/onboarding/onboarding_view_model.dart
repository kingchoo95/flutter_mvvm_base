import 'dart:async';

import 'package:mvvm_base/presentation/base/baseViewModel.dart';

import '../../domain/model.dart';

class OnboardingViewModel extends BaseViewModel with OnboardingViewModelInput, OnboardingViewModelOutput{
final StreamController _streamController = StreamController<SliderViewObject>();

  // input
  @override
  void dispose() {
    // TODO: implement dispose
  }

  // output
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void getNext() {
    // TODO: implement getNext
  }

  @override
  void getPrevious() {
    // TODO: implement getPrevious
  }

  @override
  void onPageChange(int index) {
    // TODO: implement onPageChange
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outpitSliderViewObject
  Stream<SliderViewObject> get outpitSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => throw UnimplementedError();

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