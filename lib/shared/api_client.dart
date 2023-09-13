import 'package:dio/dio.dart';

class ApiClient
{
  Dio _dio= Dio();
  Future<Response> get( url)
  {
    return _dio.get(url);
  }
  post(url,data)
  {
    return _dio.post(url,data: data);
  }
}