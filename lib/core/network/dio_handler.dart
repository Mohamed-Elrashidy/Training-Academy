import 'package:dio/dio.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/network/base_query_parameter_model.dart';
import 'package:training_acedamy/core/network/supbapase_constants.dart';

class DioHandler {
  DioHandler._supapase() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfigurations.supabaseUrl + SupbapaseConstants.version,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'apikey': AppConfigurations.supabaseKey,
          'Authorization': 'Bearer ${AppConfigurations.supabaseKey}',
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  DioHandler._coinGecko() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.coingecko.com/api/v3",
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          'x-cg-demo-api-key': 'CG-r7uJPXipmRgQTS87hVPxAksD',
        },
      ),
    );
  }

  late final Dio _dio;
  DioHandler supabase = DioHandler._supapase();

  /// Function Name: getRequest
  ///
  /// Purpose: Performs GET request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path (e.g. /users)
  /// - queryParameters: optional query map
  ///
  /// Returns: Future<Response<dynamic>>
  Future<Response<dynamic>> getRequest(
    String path, {
    BaseQueryParameterModel? queryParameters,
  }) {
    return _dio.get(path, queryParameters: queryParameters?.toMap());
  }

  /// Function Name: postRequest
  ///
  /// Purpose: Performs POST request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path
  /// - data: request body payload
  ///
  /// Returns: Future<Response<dynamic>>
  Future<Response<dynamic>> postRequest(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  /// Function Name: patchRequest
  ///
  /// Purpose: Performs PATCH request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path
  /// - data: request body payload
  /// - queryParameters: optional filter query
  ///
  /// Returns: Future<Response<dynamic>>
  Future<Response<dynamic>> patchRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.patch(path, data: data, queryParameters: queryParameters);
  }

  /// Function Name: deleteRequest
  ///
  /// Purpose: Performs DELETE request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path
  /// - queryParameters: optional filter query
  ///
  /// Returns: Future<Response<dynamic>>
  Future<Response<dynamic>> deleteRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.delete(path, queryParameters: queryParameters);
  }
}
