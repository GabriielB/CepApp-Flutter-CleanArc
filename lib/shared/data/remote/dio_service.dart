import 'dart:developer';
import 'dart:io';

import 'package:cep_app/shared/const/const_strings.dart';
import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/models/api_response_model.dart';
import 'package:cep_app/shared/data/remote/api_service.dart';
import 'package:cep_app/shared/data/remote/errors/api_exception.dart';
import 'package:dio/dio.dart';

final class DioService implements ApiService {
  // Injeção de dependência do Dio
  final Dio _dio;
  DioService(this._dio);

  @override
  Future<Either<ApiException, ApiResponseModel>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response(:data, :statusCode, :statusMessage) = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      return Right(
        ApiResponseModel<T>(
          data: data,
          statusCode: statusCode,
          statusMessage: statusMessage,
        ),
      );
    } on SocketException catch (error, st) {
      const identifier = "Socket  Exception  on Get Request";
      log(identifier, error: error, stackTrace: st);
      return Left(
        ApiException(
          identifier: identifier,
          message: ConstStrings.kNoInternetConnectionMessage,
          statusCode: 1,
          errorStatus: ErrorStatus.noConnection,
        ),
      );
    } on DioException catch (dioError, st) {
      const identifier = "Dio Exception on Get Request";
      log(identifier, error: dioError, stackTrace: st);
      return Left(
        ApiException(
          identifier: identifier,
          statusCode: dioError.response?.statusCode,
          message:
              dioError.message ??
              dioError.response?.data?['message'] ??
              ConstStrings.kDefaultErrorMessage,
          errorStatus:
              dioError.type == DioExceptionType.connectionTimeout ||
                  dioError.type == DioExceptionType.connectionError
              ? ErrorStatus.noConnection
              : switch (dioError.response?.statusCode) {
                  400 => ErrorStatus.badRequest,
                  401 || 403 => ErrorStatus.unauthorized,
                  500 => ErrorStatus.internalServerError,
                  _ => ErrorStatus.unknown,
                },
        ),
      );
    } catch (e, st) {
      const identifier = "GenericException on Get Request";
      log(identifier, error: e, stackTrace: st);
      return Left(
        ApiException(
          identifier: identifier,
          message: ConstStrings.kDefaultErrorMessage,
          statusCode: 3,
          errorStatus: ErrorStatus.unknown,
        ),
      );
    }
  }
}
