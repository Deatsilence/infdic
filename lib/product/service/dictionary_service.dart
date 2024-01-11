import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/product/utility/constants/enums/domain_paths.dart';
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
  Future<dynamic> dioGet<T extends BaseModel<T>>({
    required String domain,
    required String value,
    required T model,
  }) async {
    try {
      final response = await _dio.get<dynamic>('$_baseUrl$domain/$value');

      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          if (responseBody is List) {
            debugPrint('responseBody: $responseBody');
            return responseBody
                .map(
                  (e) => model.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList();
          } else if (responseBody is Map) {
            return model.fromJson(
              responseBody.cast<String, dynamic>(),
            ); //! compute will come here
          }
          return responseBody;
        // case HttpStatus.badRequest
        default:
          return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
