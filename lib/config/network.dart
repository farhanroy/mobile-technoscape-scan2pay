import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/logging_interceptor.dart';

class Network {
  static final Network _instance = Network._internal();

  factory Network() => _instance;

  late Dio _dio;

  Network._internal() {
    _dio = Dio(defaultBaseOption());
    _dio.interceptors.add(LoggingInterceptor());
  }

  BaseOptions defaultBaseOption() {
    return BaseOptions(
      baseUrl: Constants.baseUrl,
      contentType: Headers.jsonContentType,
        followRedirects: true
    );
  }

  Options defaultOption() {
    return Options(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Content-Type': 'application/json'}
    );
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options ?? defaultOption(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> getWithToken(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');

      final Response response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': "Bearer $token"
            }
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options ?? defaultOption(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> postWithToken(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');

      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': "Bearer $token"
            }
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> put(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options ?? defaultOption(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:----------------------------------------------------------------------
  Future<Response> putWithToken(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');

      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': "$token"
            }
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}