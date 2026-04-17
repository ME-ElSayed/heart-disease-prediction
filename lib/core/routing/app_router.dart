import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_disease_prediction/core/di/dependency_injection.dart';
import 'package:heart_disease_prediction/core/helper/shared_pref_helper.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';

import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/prediction/data/model/predict_response.dart';
import '../../features/prediction/data/model/prediction_input_data.dart';
import '../../features/prediction/data/repo/prediction_repo.dart';
import '../../features/prediction/presentation/view/health_input_screen.dart';
import '../../features/prediction/presentation/cubits/prediction/prediction_cubit.dart';
import '../../features/result/view/result_screen.dart';
import '../networking/dio_factory.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.onboarding,
    redirect: (context, state) {
      final seen =
          getIt<SharedPrefHelper>().boolGetter(key: 'seenOnboarding') ?? false;

      // If already seen onboarding and trying to go there again → skip to healthInput
      if (seen && state.matchedLocation == Routes.onboarding) {
        return Routes.healthInput;
      }

      return null; // no redirect
    },
    routes: [
      GoRoute(
        path: Routes.onboarding,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: Routes.healthInput,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<PredictionCubit>(
                create: (_) =>
                    PredictionCubit(PredictionRepo(DioFactory.getDio())),
              ),
              BlocProvider<HealthInputCubit>(create: (_) => HealthInputCubit()),
            ],
            child: const HealthInputScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOutCubic));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: Routes.result,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          if (extra == null) {
            throw Exception('Extra data is required for result route');
          }

          final response = extra['response'] as PredictResponse;
          final inputData = extra['inputData'] as PredictionInputData;


          return CustomTransitionPage(
            key: state.pageKey,
            child: ResultScreen(response: response, inputData: inputData),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeIn,
                    ).animate(animation),
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.92, end: 1.0).animate(
                        CurveTween(
                          curve: Curves.easeOutBack,
                        ).animate(animation),
                      ),
                      child: child,
                    ),
                  );
                },
          );
        },
      ),
    ],
  );
}
