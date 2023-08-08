import 'package:dio/dio.dart';

///
class TheDioInterceptor implements Interceptor {
  ///
  TheDioInterceptor(this._dio);

  final Dio _dio;
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
  }
}
