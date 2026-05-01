import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/di/dependency_injection.dart';
import 'package:heart_disease_prediction/core/routing/app_router.dart';
import 'package:heart_disease_prediction/core/theme/cubit/theme_cubit.dart';
import 'package:heart_disease_prediction/core/theme/themedata/theme_data_dark.dart';
import 'package:heart_disease_prediction/core/theme/themedata/theme_data_light.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );

  await dotenv.load(fileName: ".env");
  await setupServiceLocator();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const HeartDiseasePrediction());
}

class HeartDiseasePrediction extends StatelessWidget {
  const HeartDiseasePrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: ScreenUtilInit(
        designSize: const Size(390, 949),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                title: 'Heart Check',
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: themeMode,
                builder: (context, routerChild) {
                  final theme = Theme.of(context);
                  final isDarkMode = theme.brightness == Brightness.dark;

                  return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: isDarkMode
                          ? Brightness.light
                          : Brightness.dark,
                      statusBarBrightness: isDarkMode
                          ? Brightness.dark
                          : Brightness.light,
                      systemNavigationBarColor: theme.scaffoldBackgroundColor,
                      systemNavigationBarIconBrightness: isDarkMode
                          ? Brightness.light
                          : Brightness.dark,
                    ),
                    child: routerChild ?? const SizedBox.shrink(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
