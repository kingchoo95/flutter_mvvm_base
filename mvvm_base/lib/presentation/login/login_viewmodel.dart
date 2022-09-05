import 'package:mvvm_base/presentation/base/baseViewModel.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput, LoginViewModelOutputs{
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => throw UnimplementedError();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsUserPasswordValid
  Stream<bool> get outputIsUserPasswordValid => throw UnimplementedError();

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

}

abstract class LoginViewModelInput{
  // three function
  setUserName(String userName);
  setPassword(String password);
  login();
  // two sinks
  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsUserPasswordValid;
}