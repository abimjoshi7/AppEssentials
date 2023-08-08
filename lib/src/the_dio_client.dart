import 'package:dio/dio.dart';
import 'package:the_dio/src/core/core.dart';
import 'package:the_dio/src/the_dio_interceptor.dart';

///

/// {@template the_dio}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
typedef TransferProgress = void Function(int, int);

/// {@macro the_dio}
class TheDioClient {
  /// {@macro the_dio}
  TheDioClient(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      headers: Endpoints.headers,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    _dio.interceptors.add(
      TheDioInterceptor(
        _dio,
      ),
    );
  }

  final Dio _dio;

  ///
  static final _requestOptions = RequestOptions(
    baseUrl: Endpoints.baseUrl,
  );

  ///
  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    Options? options,
  }) async =>
      _dio
          .get<dynamic>(
            path,
            queryParameters: queryParams,
            onReceiveProgress: recieveProgress,
            options: options,
          )
          .then(
            (value) => value,
          )
          .onError(
            (error, stackTrace) async => Response(
              requestOptions: _requestOptions,
            ),
          );

  ///
  Future<Response<dynamic>> post({
    required String path,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    TransferProgress? sendProgress,
    Options? options,
  }) async =>
      _dio
          .post<dynamic>(
            path,
            queryParameters: queryParams,
            onReceiveProgress: recieveProgress,
            onSendProgress: sendProgress,
            options: options,
          )
          .then(
            (value) => value,
          )
          .onError(
            (error, stackTrace) async => Response(
              requestOptions: _requestOptions,
            ),
          );

  ///
  Future<Response<dynamic>> patch({
    required String path,
    Map<String, dynamic>? queryParams,
    TransferProgress? recieveProgress,
    TransferProgress? sendProgress,
    Options? options,
  }) async =>
      _dio
          .patch<dynamic>(
            path,
            queryParameters: queryParams,
            onReceiveProgress: recieveProgress,
            onSendProgress: sendProgress,
            options: options,
          )
          .then(
            (value) => value,
          )
          .onError(
            (error, stackTrace) async => Response(
              requestOptions: _requestOptions,
            ),
          );

  ///
  Future<Response<dynamic>> delete({
    required String path,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async =>
      _dio
          .delete<dynamic>(
            path,
            queryParameters: queryParams,
            options: options,
          )
          .then(
            (value) => value,
          )
          .onError(
            (error, stackTrace) async => Response(
              requestOptions: _requestOptions,
            ),
          );
}
