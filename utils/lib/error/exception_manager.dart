class ExceptionManager {
  const ExceptionManager._();

  Map<int, String> get mappedStatusCodes => _codesMap;

  static const _codesMap = {
    93: 'Host User',
    94: 'Choose Tenant from Tenant List',
    95: 'Required two-factor authentication',
    96: 'User Locked',
    97: 'User Id not found',
    98: 'Unable to send email',
    99: 'Email verification required',
    200: 'Successfully completed',
    205: 'Password Reset Required',
    400: 'Bad Request. Contact your administrator',
    401: 'Unauthorized response',
    404: 'Not Found',
    409: 'Duplicate values',
    405: 'Invalid Input / Validation',
    500: 'Internal Server Error',
    201: 'Data not found',
    202: 'Email Not Found',
    100: 'Online Registration Not available for this department',
    102: 'Payment Reference no not available',
  };

  static Exception getException(int? statusCode, [String? message]) {
    if (_codesMap.containsKey(statusCode)) {
      return Exception(
        _codesMap[statusCode],
      );
    } else {
      return Exception(
          message ?? "[$statusCode]:Unknown error. Please try again.");
    }
  }
}
