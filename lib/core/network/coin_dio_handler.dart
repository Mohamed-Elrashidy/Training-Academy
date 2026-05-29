import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:training_acedamy/core/network/api_error_model.dart';
import 'package:training_acedamy/core/network/error_handler.dart';

class CoinDioHandler {
  late final Dio _dio;

  CoinDioHandler._coinGecko() {
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

    _dio.interceptors.addAll([loginIntercpetor(), retryInterceptor()]);
  }
  CoinDioHandler coinGecko = CoinDioHandler._coinGecko();

  Future<Either<ApiErrorModel, dynamic>> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Either<ApiErrorModel, dynamic> response;
    try {
      final res = await _dio.get(endPoint, queryParameters: queryParameters);
      response = handleResponse(res);
    } catch (e) {
      response = Left(ErrorHandler.handleError(e));
    }
    return response;
  }

  Future<Either<ApiErrorModel, dynamic>> post(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    Either<ApiErrorModel, dynamic> response;
    try {
      final res = await _dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      response = handleResponse(res);
    } catch (e) {
      response = Left(ErrorHandler.handleError(e));
    }
    return response;
  }

  Future<Either<ApiErrorModel, dynamic>> uploadFile(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    required FormData data,
  }) async {
    Either<ApiErrorModel, dynamic> response;
    try {
      final res = await _dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: data,
      );
      response = Right(res.data);
    } catch (e) {
      response = Left(ErrorHandler.handleError(e));
    }
    return response;
  }

  Future<Either<ApiErrorModel, dynamic>> downloadFile(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    required String savePath,
  }) async {
    Either<ApiErrorModel, dynamic> response;
    try {
      final res = await _dio.download(
        endPoint,
        savePath,
        queryParameters: queryParameters,
      );
      response = handleResponse(res);
    } catch (e) {
      response = Left(ErrorHandler.handleError(e));
    }
    return response;
  }

  Either<ApiErrorModel, dynamic> handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return Right(response.data);
    } else {
      return Left(ErrorHandler.handleError(response));
    }
  }

  Future<Either<ApiErrorModel, dynamic>> getDataAsStream(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Either<ApiErrorModel, dynamic> response;
    try {
      final res = await _dio.get<ResponseBody>(
        endPoint,
        queryParameters: queryParameters,
        options: Options(responseType: ResponseType.stream),
      );

      List<int> bytes = [];

      final stream = res.data!.stream;
      await for (final chunk in stream) {
        print('Received ${chunk.length} bytes');
        bytes.addAll(chunk);
      }
      response = Right(bytes);
    } catch (e) {
      response = Left(ErrorHandler.handleError(e));
    }
    return response;
  }

  loginIntercpetor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = '';
        // Do something before request is sent.
        return handler.next(options); //continue
      },
      onError: (error, handler) {
        // Do something with response error
        return handler.next(error); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
    );
  }

  retryInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        final requestOptions = error.requestOptions;
        int retryCount = requestOptions.extra['retryCount'] ?? 0;
        if (error.type == DioExceptionType.connectionTimeout &&
            retryCount < 3) {
          retryCount++;
          try {
            requestOptions.extra['retryCount'] = retryCount;
            _dio.fetch(requestOptions);
          } catch (e) {
            return handler.next(error);
          }
        }
      },
    );
  }
}
