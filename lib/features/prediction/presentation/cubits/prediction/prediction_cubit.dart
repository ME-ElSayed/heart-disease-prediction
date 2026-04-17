import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_prediction/core/networking/api_error_handler.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/predict_request.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/prediction_input_data.dart';
import 'package:heart_disease_prediction/features/prediction/data/repo/prediction_repo.dart';

import 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  final PredictionRepo _repo;
  PredictionCubit(this._repo) : super(PredictionInitial());

  Future<void> predictDisease(PredictRequest request) async {
    emit(PredictionLoading());

    try {
      final response = await _repo.predict(request);
      final inputData = PredictionInputData(
        age: request.age,
        trestbps: request.trestbps,
        chol: request.chol,
        thalch: request.thalch,
        oldpeak: request.oldpeak,
        ca: request.ca,
        cp: request.cp,
        slope: request.slope,
        thal: request.thal,
        sex: request.sex,
        fbs: request.fbs,
        restecg: request.restecg,
        exang: request.exang,
      );
      emit(PredictionSuccess(response: response, inputData: inputData));
    } catch (error) {
      emit(PredictionError(message: ApiErrorHandler.handle(error)));
    }
  }
  void reset() => emit(PredictionInitial());
}
