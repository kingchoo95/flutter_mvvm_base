import 'package:dartz/dartz.dart';
import 'package:mvvm_base/app/function.dart';
import 'package:mvvm_base/data/network/failure.dart';
import 'package:mvvm_base/data/request/request.dart';
import 'package:mvvm_base/domain/model/model.dart';
import 'package:mvvm_base/domain/repository/repository.dart';
import 'package:mvvm_base/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication>{
  Repository _repository;
  LoginUseCase(this._repository);
  
  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }

}

class LoginUseCaseInput{
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}