// service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:heart_disease_prediction/core/helper/shared_pref_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize SharedPrefHelper asynchronously, then register as singleton
  final sharedPrefHelper = await SharedPrefHelper().init();
  getIt.registerSingleton<SharedPrefHelper>(sharedPrefHelper);

  // Register other services here...
}