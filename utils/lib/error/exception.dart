part of 'error.dart';

/// Base class for all custom exceptions in the application.
/// This class centralizes the message handling logic for exceptions.
abstract class AppException implements Exception {
  final String? message;
  const AppException([this.message]);

  @override
  String toString() => message ?? "AppException";
}

/// Exception for permissions.
class PermissionDeniedException extends AppException {
  const PermissionDeniedException([super.message]);
}

/// Exception for unknown errors.
class UnknownException extends AppException {
  const UnknownException([super.message]);
}

/// Exception for server-related errors.
class ServerException extends AppException {
  final int? statusCode;
  const ServerException([super.message, this.statusCode]);

  @override
  String toString() =>
      "ServerException${statusCode != null ? " (Status Code: $statusCode)" : ""}: ${message ?? "Unknown error"}";
}

/// Exception for cache-related errors.
class CacheException extends AppException {
  const CacheException([super.message]);
}

/// Exception for unauthorized access errors.
class UnAuthorizedException extends AppException {
  const UnAuthorizedException([super.message]);
}

/// Exception for login-related errors.
class LoginException extends AppException {
  const LoginException([super.message]);
}

/// Exception for forgot password errors.
class ForgotPasswordException extends LoginException {
  const ForgotPasswordException([super.message]);
}

/// Exception for empty list errors.
class EmptyListException extends AppException {
  const EmptyListException([super.message]);
}

/// Exception for network request failures.
class RestClientException extends AppException {
  final int? statusCode;
  const RestClientException([super.message, this.statusCode]);

  @override
  String toString() =>
      "RestClientException${statusCode != null ? " (Status Code: $statusCode)" : ""}: ${message ?? "Network error"}";
}
