import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';

/// [DictionaryService] for general dictionary
final class DictionaryService {
  DictionaryService._init() {
    _baseUrl = DevEnv().baseUrl;
    debugPrint('baseUrl: $_baseUrl');
    final baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio = Dio(baseOptions);
  }

  static DictionaryService? _instance;

  /// [DictionaryService] singleton instance of
  /// [DictionaryService]
  static DictionaryService get instance {
    _instance ??= DictionaryService._init();
    return _instance!;
  }

  late String _baseUrl;
  late Dio _dio;

  /// [dioGet] is the get method generic for [BaseModel]
  Future<dynamic> dioGet<T extends BaseModel<T>>(String word, T model) async {
    try {
      final response = await _dio.get<dynamic>('$_baseUrl/dictionary/$word');
      debugPrint('response: ${response.data}');
      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (responseBody is List) {
            return responseBody.map((e) {
              if (e is Map<String, dynamic>) {
                return model.fromJson(e);
              } else {
                throw Exception('Invalid element type');
              }
            }).toList();
          } else if (responseBody is Map<String, dynamic>) {
            return model.fromJson(responseBody);
          }
          return responseBody;
        // Add more status code handling as necessary
        default:
      }
    } catch (e) {
      Logger();
    }
  }
}
