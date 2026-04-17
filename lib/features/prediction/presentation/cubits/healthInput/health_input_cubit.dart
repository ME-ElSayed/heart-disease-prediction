import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_prediction/core/helper/form_scroll.dart';
import 'package:heart_disease_prediction/core/helper/show_message.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/predict_request.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/prediction/prediction_cubit.dart';

class HealthInputCubit extends Cubit<HealthInputFormState> {
  HealthInputCubit() : super(const HealthInputFormState());

// to update selection fields, we emit a new state with the updated value while keeping the rest unchanged
   void updateSex(String? value) => emit(state.copyWith(selectedSex: value));
    void updateCp(String? value) => emit(state.copyWith(selectedCp: value));
    void updateSlope(String? value) =>
        emit(state.copyWith(selectedSlope: value));
    void updateThal(String? value) => emit(state.copyWith(selectedThal: value));
    void updateRestecg(String? value) =>
        emit(state.copyWith(selectedRestecg: value));
    void updateCa(int value) => emit(state.copyWith(ca: value));
    void updateFbs(bool value) => emit(state.copyWith(fbs: value));
    void updateExang(bool value) => emit(state.copyWith(exang: value));
//fileds related to form and input controllers — these are purely UI concerns and don't need to be in the state, so we keep them as regular class members
  final formKey = GlobalKey<FormState>();
  // Text controllers live here — they're purely UI concerns, not state
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bpController = TextEditingController();
  final TextEditingController cholController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController oldpeakController = TextEditingController();


  void onSubmit(BuildContext context, HealthInputFormState formState) {
    if (!formKey.validateAndScroll()) return;

    if (!formState.isComplete) {
      showMessage(
        context,
        'Please fill in all selection fields',
        isError: true,
      );
      return;
    }
 final request = PredictRequest(
      age: int.parse(ageController.text),
      trestbps: int.parse(bpController.text),
      chol: int.parse(cholController.text),
      thalch: int.parse(heartRateController.text),
      oldpeak: double.parse(oldpeakController.text),
      ca: formState.ca,
      cp: formState.selectedCp!,
      slope: formState.selectedSlope!,
      thal: formState.selectedThal!,
      sex: formState.selectedSex!,
      fbs: formState.fbs,
      restecg: formState.selectedRestecg!,
      exang: formState.exang,
    );
    context.read<PredictionCubit>().predictDisease(request);
   
  }
}
