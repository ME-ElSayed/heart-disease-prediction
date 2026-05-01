import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heart_disease_prediction/core/helper/form_showcase_keys.dart';
import 'package:heart_disease_prediction/core/helper/shared_pref_helper.dart';
import 'package:heart_disease_prediction/core/theme/app_colors.dart';
import 'package:heart_disease_prediction/core/widgets/app_button.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/health_metrics_section.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/personal_info_section.dart';
import 'package:showcaseview/showcaseview.dart';

class HeathInputForm extends StatefulWidget {
  const HeathInputForm({super.key});
  @override
  State<HeathInputForm> createState() => _HeathInputFormState();
}

class _HeathInputFormState extends State<HeathInputForm> {
  final _keys = FormShowcaseKeys();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prefs = GetIt.instance.get<SharedPrefHelper>();
      if (!(prefs.boolGetter(key: 'form_guide_seen') ?? false)) {
        ShowCaseWidget.of(context).startShowCase(_keys.allKeys);
        prefs.boolSetter(key: 'form_guide_seen', value: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLow,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
                child: Form(
                  key: context.read<HealthInputCubit>().formKey,
                  child: BlocBuilder<HealthInputCubit, HealthInputFormState>(
                    builder: (context, formState) {
                      return Column(
                        children: [
                          PersonalInfoSection(
                            ageController: context
                                .read<HealthInputCubit>()
                                .ageController,
                            selectedSex: formState.selectedSex,
                            onSexChanged: context
                                .read<HealthInputCubit>()
                                .updateSex,
                            ageKey: _keys.age, //  pass keys
                            sexKey: _keys.sex,
                          ),
                          SizedBox(height: 16.h),
                          HealthMetricsSection(
                            bpController: context
                                .read<HealthInputCubit>()
                                .bpController,
                            cholController: context
                                .read<HealthInputCubit>()
                                .cholController,
                            heartRateController: context
                                .read<HealthInputCubit>()
                                .heartRateController,
                            oldpeakController: context
                                .read<HealthInputCubit>()
                                .oldpeakController,
                            formState: formState,
                            cubit: context.read<HealthInputCubit>(),
                            showcaseKeys: _keys, //  pass all keys
                          ),
                          SizedBox(height: 24.h),
                          AppButton(
                            height: 72.h,
                            text: 'Generate Risk Profile',
                            icon: Icons.auto_awesome_rounded,
                            onPressed: () => context
                                .read<HealthInputCubit>()
                                .onSubmit(context, formState),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
