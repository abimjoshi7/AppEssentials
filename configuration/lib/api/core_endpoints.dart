part of 'api.dart';

abstract class CoreEndpoints {
  const CoreEndpoints._();
  static const String apiVersion = 'api';

  // static const String apiIUrl = '';
  static const String apiUrl = "$baseUrl/$apiVersion/";
  static const String baseUrl = kReleaseMode ? productionUrl : demoUrl;
  static const String sandboxUrl = 'https://sandbox.bizakerp.com.np';
  static const String productionUrl = 'https://system.bizakerp.com.np';
  static const String demoUrl = 'https://demo.bizakerp.com.np/';
  static const String localUrl = 'http://192.168.18.7:7070/';

  static const Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Accept': 'text/plain',
  };

  static const Duration timeoutDuration = Duration(seconds: 20);
  static const bool enableLogging = true;

  static const String orsUrl = 'https://api.openrouteservice.org/v2/';

  static const Map<String, dynamic> orsHeaders = {
    'Accept': 'application/geo+json;charset=UTF-8',
    'Content-Type': 'application/json',
    // ignore: unnecessary_const
    'Authorization': const String.fromEnvironment('ORS_KEY'),
  };
}
