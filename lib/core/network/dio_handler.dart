import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:training_acedamy/core/configurations/app_configurations.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/error_handler.dart';
import 'package:training_acedamy/core/network/supbapase_constants.dart';

class DioHandler {
  factory DioHandler.supabase() => DioHandler._supapase();

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

  late final Dio _dio;

  /// Function Name: getRequest
  ///
  /// Purpose: Performs GET request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path (e.g. /users)
  /// - queryParameters: optional query map
  /// - headers: optional request headers
  ///
  /// Returns: Future<Either<ApiErrorModel, dynamic>>
  Future<Either<ApiErrorModel, dynamic>> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: headers == null ? null : Options(headers: headers),
      );
      return handleResponse(response);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  /// Function Name: postRequest
  ///
  /// Purpose: Performs POST request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path
  /// - data: request body payload
  /// - queryParameters: optional query map
  /// - headers: optional request headers
  ///
  /// Returns: Future<Either<ApiErrorModel, dynamic>>
  Future<Either<ApiErrorModel, dynamic>> postRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers == null ? null : Options(headers: headers),
      );
      return handleResponse(response);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
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
  /// Returns: Future<Either<ApiErrorModel, dynamic>>
  Future<Either<ApiErrorModel, dynamic>> patchRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: headers == null ? null : Options(headers: headers),
      );
      return handleResponse(response);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  /// Function Name: deleteRequest
  ///
  /// Purpose: Performs DELETE request to Supabase REST endpoint.
  ///
  /// Parameters:
  /// - path: relative endpoint path
  /// - queryParameters: optional filter query
  ///
  /// Returns: Future<Either<ApiErrorModel, dynamic>>
  Future<Either<ApiErrorModel, dynamic>> deleteRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: headers == null ? null : Options(headers: headers),
      );
      return handleResponse(response);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Either<ApiErrorModel, dynamic> handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return Right(response.data);
    }

    return Left(ErrorHandler.handleError(response));
  }
}
