import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static final String baseUrl = (dotenv.env['BASE_URL'] ?? '').trim();
  static const String predictEndpoint = '/api/predict/';
}
