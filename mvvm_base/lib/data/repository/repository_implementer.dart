import 'package:dartz/dartz.dart';
import 'package:mvvm_base/data/mapper/mapper.dart';
import 'package:mvvm_base/data/network/error_handler.dart';
import 'package:mvvm_base/data/network/failure.dart';
import 'package:mvvm_base/data/network/network_info.dart';
import 'package:mvvm_base/data/remote_data_source.dart';
import 'package:mvvm_base/data/request/request.dart';
import 'package:mvvm_base/domain/model/model.dart';
import 'package:mvvm_base/domain/repository/repository.dart';

class RepositoryImplementer extends Repository{
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try{
        // call api
        final response = await _remoteDataSource.login(loginRequest);

        if(response.status == ApiInternalStatus.SUCCESS){
          // success
          return Right(response.toDomain());
        }else{
          // error 0
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE, response.message?? ResponseMessage.DEFAULT));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
}