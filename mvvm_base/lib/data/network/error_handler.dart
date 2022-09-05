import 'package:dio/dio.dart';
import 'package:mvvm_base/data/network/failure.dart';

enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      // dio error so its error from response of the API
      failure = _handleError(error);
    }else{
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error){
    switch(error.type){
      case DioErrorType.connectTimeout:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch(error.response?.statusCode){
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioErrorType.other:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource{
  Failure getFailure(){
      switch(this){
        case DataSource.BAD_REQUEST:
          return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
        case DataSource.FORBIDDEN:
          return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
        case DataSource.UNAUTHORISED:
          return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
        case DataSource.NOT_FOUND:
          return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
        case DataSource.INTERNAL_SERVER_ERROR:
          return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);
        case DataSource.CONNECTION_TIMEOUT:
          return Failure(ResponseCode.CONNECTION_TIMEOUT, ResponseMessage.CONNECTION_TIMEOUT);
        case DataSource.CANCEL:
          return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
        case DataSource.RECIEVE_TIMEOUT:
          return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
        case DataSource.SEND_TIMEOUT:
          return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
        case DataSource.CACHE_ERROR:
          return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
        case DataSource.NO_INTERNET_CONNECTION:
          return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
        case DataSource.DEFAULT:
          return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
        default:
          return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      }
  }
}

class ResponseCode{
  // API status code
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400; // fail, api reject request
  static const int FORBIDDEN = 403;
  static const int UNAUTHORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECTION_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECIEVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage{
  // API status code
  static const String SUCCESS = "success";
  static const String NO_CONTENT = "success with no content";
  static const String BAD_REQUEST = "Bad request, please try again later"; // fail, api reject request
  static const String FORBIDDEN = "Forbidden request, please try again later";
  static const String UNAUTHORISED = "user is not authorised.";
  static const String NOT_FOUND = "URL is not found, please try again later";
  static const String INTERNAL_SERVER_ERROR = "something went wrong, please try again later";

  // local status code
  static const String DEFAULT = "something went wrong, please try again later";
  static const String CONNECTION_TIMEOUT = "timeout error, please try again later.";
  static const String CANCEL = "Request was cancelled, please try again later";
  static const String RECIEVE_TIMEOUT = "Time out error, please try again later";
  static const String SEND_TIMEOUT = "Time out error, please try again later";
  static const String CACHE_ERROR = "Cache error, please try again later";
  static const String NO_INTERNET_CONNECTION = "No Internet connection, please try again later";
}

class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}