import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {

  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.getpostman.com',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        }
      ),
    );
  }

  static Future<Response>getData({
    required String url,
  required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

}


// https://www.getpostman.com/collections/3223d639447a8524e38f
