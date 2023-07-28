import 'package:dio/dio.dart';

class Network {
  static final Network _instance = Network._internal();

  factory Network() => _instance;

  late Dio _dio;

  Network._internal() {
    _dio = Dio();
  }
}