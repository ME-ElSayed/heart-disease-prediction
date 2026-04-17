import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_disease_prediction/core/helper/show_message.dart';
import 'package:heart_disease_prediction/core/routing/routes.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/prediction/prediction_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/prediction/prediction_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/health_input_form.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/loading_view.dart';
import 'package:showcaseview/showcaseview.dart';

class HealthInputScreen extends StatelessWidget {
  const HealthInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictionCubit, PredictionState>(
      listener: (context, state) {
        if (state is PredictionSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(
              Routes.result,
              extra: {'response': state.response, 'inputData': state.inputData},
            );
          });
          context.read<PredictionCubit>().reset();
        } else if (state is PredictionError) {
          showMessage(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            ShowCaseWidget(
              enableAutoScroll:true ,
              onFinish: () => debugPrint('Guide finished'),
              builder: (context) => const HeathInputForm(),
            ),

            if (state is PredictionLoading)
              const LoadingView(), // full screen overlay
          ],
        );
      },
    );
  }
}
