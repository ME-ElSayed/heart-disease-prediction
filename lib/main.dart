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
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  
  await dotenv.load(fileName: ".env");
  await setupServiceLocator();
  

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

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
    return ScreenUtilInit(
      designSize: const Size(390, 949),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, newMode) {
        return BlocProvider(
          create: (context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, newMode) {
              return MaterialApp.router(
                title: 'Heart Check',
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,

                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: newMode,
              );
            },
          ),
        );
      },
    );
  }
}
