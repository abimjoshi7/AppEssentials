import 'package:utils/error/error.dart';

class ExceptionManager {
  const ExceptionManager._();

  static const Map<int, String> _codesMap = {
    // 1xx - Informational
    100: "Continue",
    101: "Switching Protocols",
    102: "Processing",
    103: "Early Hints",

    // 2xx - Success
    200: "OK",
    201: "Created",
    202: "Accepted",
    203: "Non-Authoritative Information",
    204: "No Content",
    205: "Reset Content",
    206: "Partial Content",
    207: "Multi-Status",
    208: "Already Reported",
    226: "IM Used",

    // 3xx - Redirection
    300: "Multiple Choices",
    301: "Moved Permanently",
    302: "Found",
    303: "See Other",
    304: "Not Modified",
    307: "Temporary Redirect",
    308: "Permanent Redirect",

    // 4xx - Client Errors
    400: "Bad Request",
    401: "Unauthorized",
    402: "Payment Required",
    403: "Forbidden",
    404: "Not Found",
    405: "Method Not Allowed",
    406: "Not Acceptable",
    407: "Proxy Authentication Required",
    408: "Request Timeout",
    409: "Conflict",
    410: "Gone",
    411: "Length Required",
    412: "Precondition Failed",
    413: "Payload Too Large",
    414: "URI Too Long",
    415: "Unsupported Media Type",
    416: "Range Not Satisfiable",
    417: "Expectation Failed",
    418: "I'm a Teapot", // Easter egg status code
    422: "Unprocessable Entity",
    423: "Locked",
    424: "Failed Dependency",
    426: "Upgrade Required",
    428: "Precondition Required",
    429: "Too Many Requests",
    431: "Request Header Fields Too Large",
    451: "Unavailable For Legal Reasons",

    // 5xx - Server Errors
    500: "Internal Server Error",
    501: "Not Implemented",
    502: "Bad Gateway",
    503: "Service Unavailable",
    504: "Gateway Timeout",
    505: "HTTP Version Not Supported",
    506: "Variant Also Negotiates",
    507: "Insufficient Storage",
    508: "Loop Detected",
    510: "Not Extended",
    511: "Network Authentication Required",
  };

  static Map<int, String> get mappedStatusCodes => _codesMap;

  static AppException getException(int? statusCode, [String? message]) {
    if (statusCode == null) {
      return UnknownException(message ?? "Unknown error. Please try again.");
    }

    switch (statusCode) {
      // Client Errors
      case 400:
        return RestClientException(message ?? _codesMap[400]);
      case 401:
        return UnAuthorizedException(message ?? _codesMap[401]);
      case 403:
        return PermissionDeniedException(message ?? _codesMap[403]);
      case 404:
        return RestClientException(message ?? _codesMap[404]);
      case 405:
        return RestClientException(message ?? _codesMap[405]);
      case 408:
        return RestClientException(message ?? _codesMap[408]);
      case 409:
        return RestClientException(message ?? _codesMap[409]);
      case 422:
        return RestClientException(message ?? _codesMap[422]);
      case 429:
        return RestClientException(message ?? _codesMap[429]);

      // Server Errors
      case 500:
        return ServerException(message ?? _codesMap[500], statusCode);
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
      case 507:
      case 508:
      case 510:
      case 511:
        return ServerException(message ?? _codesMap[statusCode], statusCode);

      // Default - Unknown status code
      default:
        return UnknownException(
            message ?? "[$statusCode]: Unknown error. Please try again.");
    }
  }
}
