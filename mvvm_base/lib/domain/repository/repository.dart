import 'package:dartz/dartz.dart';
import 'package:mvvm_base/data/network/failure.dart';
import 'package:mvvm_base/data/request/request.dart';
import 'package:mvvm_base/domain/model/model.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}