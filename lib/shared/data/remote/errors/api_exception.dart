import 'package:cep_app/shared/data/models/api_base_model.dart';

enum ErrorStatus {
  unknown,
  unauthorized,
  internalServerError,
  noConnection,
  badRequest,
}

final class ApiException extends ApiBaseModel implements Exception {
  final String identifier;
  final ErrorStatus errorStatus;

  ApiException({
    required this.identifier,
    super.message,
    required super.statusCode,
    required this.errorStatus,
  });
}
