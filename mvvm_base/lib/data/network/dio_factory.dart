import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_base/app/app_preferences.dart';
import 'package:mvvm_base/app/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "LANGUGAE";

class DioFactory{
  AppSharePreferences _appSharePreferences;
  DioFactory(this._appSharePreferences);

  Future<Dio> getDio() async{
    Dio dio = Dio();
    int _timeOut = 60 * 1000; // 1 min
    String language = await _appSharePreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: language // todo get language from auth
    };

    dio.options = BaseOptions(
      baseUrl:  Constant.baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: headers
    );
    
    if(kReleaseMode){
      print("release mode no logs");
    }else{
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true
      ));
    }
    return dio;
  }
}