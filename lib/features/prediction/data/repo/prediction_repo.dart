import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../model/predict_request.dart';
import '../model/predict_response.dart';

class PredictionRepo {
  final Dio _dio;

  PredictionRepo(this._dio);

  Future<PredictResponse> predict(PredictRequest request) async {
    final response = await _dio.post(
      ApiConstants.predictEndpoint,
      data: request.toJson(),
    );
    return PredictResponse.fromJson(response.data);
  }
}
