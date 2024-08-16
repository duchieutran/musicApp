import 'package:dio/dio.dart';

class RestClient {
  late Dio _dio;
  static const jsonContentType = 'application/json ; charset=UTF-8';

  RestClient({required String baseUrl}) {
    final BaseOptions _option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: jsonContentType,
    );
    _dio = Dio(_option);
  }

  Future<dynamic> getData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (e) {
      throw "Error"; // TODO : custom error
    }
  }
}
