import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rakna/core/networking/end_points.dart';

class PaymentApiHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: PaymentEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 2),
        receiveTimeout: const Duration(seconds: 2),
        headers: {
          'Content-Type': 'application/json',
        }))
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
    Options? options,
  }) async {
    try {
      final Response response = await Dio().get(url,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress,
          options: options);
      return response;
    } on DioException catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    //bool files = false,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? contentType,
  }) async {
    try {
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      print(e);
      rethrow;
    }
  }
}
