import 'dart:convert';

import 'package:dragon_ball_catallog_flutter/utils/common/utils.dart';
import 'package:dragon_ball_catallog_flutter/utils/extensions/string.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';
import 'constants.dart';

extension HttpClientExtensions on http.Client {
  Future<ApiResponse<T>> getApiResponse<T>(
      Uri url,
      T Function(dynamic data) fromJson,
      ) async {
    try {
      final response = await get(url);

      if (isStatusSuccess(response.statusCode)) {
        final data = json.decode(response.body);
        return ApiResponse.success(fromJson(data), response.statusCode, response.reasonPhrase.orEmpty());
      } else {
        return ApiResponse.failure(response.statusCode, response.reasonPhrase.orEmpty());
      }
    } catch (e) {
      return ApiResponse.failure(statusError, 'An error occurred: $e');
    }
  }
}