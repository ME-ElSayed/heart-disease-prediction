import 'package:heart_disease_prediction/features/prediction/data/model/predict_response.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/prediction_input_data.dart';

abstract class PredictionState {}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionSuccess extends PredictionState {
  final PredictResponse response;
  final PredictionInputData inputData;

  PredictionSuccess({required this.response, required this.inputData});
}

class PredictionError extends PredictionState {
  final String message;

  PredictionError({required this.message});
}
