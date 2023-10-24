import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/cupertino.dart';

class API {
  late Dio dio;
  late String _apiKey;
  late String _baseUrl;

  API() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: log,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 3),
          Duration(seconds: 5),
        ],
        retryableExtraStatuses: {status403Forbidden},
      ),
    );
    _apiKey = "IdtPbecKIbVitUBgIIKDFGU4Y2RCfU7OjPTHWx3r";
    _baseUrl =
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos";
  }

  Future<List<Map<String, dynamic>?>> fetchPhotos(DateTime earthDate) async {
    try {
      Response response = await dio.request(
        _baseUrl,
        options: Options(method: "get"),
        queryParameters: {
          "earth_date": DateTime.now().toString(),
          "api_key" : _apiKey,
        },
      );
      debugPrint(response.statusCode.toString());
      debugPrint(earthDate.toString());
      debugPrint(response.data.toString());
      return response.data["photos"].cast<Map<String, dynamic>?>();
    } catch(e){
      if(e is DioException){
        debugPrint("dio error: ${e.message}");
      } else {
        debugPrint("Normal Error: ${e.toString()}");
      }
      return [];
    }
  }
}
