import 'package:get_it/get_it.dart';

import 'package:razor_book/services/firebase_service/barber_service_firebase/barber_service_firebase.dart';
import 'package:razor_book/services/firebase_service/customer_service_firebase/customer_service_firebase.dart';
import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
import 'package:razor_book/services/local_storage_service/sharedpref_service.dart';

import '../../services/authentication/authentication_service_firebase.dart';
import '../../services/initializer/service_initializer.dart';
import '../../services/initializer/service_initializer_firebase.dart';
import '../../view_model/forgot_password_view_model.dart';
import '../../view_model/login_view_model.dart';
export '../../../services/services.dart';

// create locator using getIt
final locator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // In case of using Firebase services, Firebase must be initialized first before the service locator,
  //  because viewmodels may need to access firebase during the creation of the objects.

  // To comply with Dependency Inversion, the Firebase.initializeApp() is called in a dedicated service file.
  //  So that, if you want to change to different services (other than Firebase), you can do so by simply
  //  defining another ServiceInitializer class.

  // await Firebase.initializeApp();

  // Register first and then run immediately
  locator.registerLazySingleton<ServiceInitializer>(
      () => ServiceInitializerFirebase());

  final serviceInitializer = locator<ServiceInitializer>();
  await serviceInitializer.init();

  // Register Services

  locator.registerLazySingleton<AuthenticationServiceFirebase>(
      () => AuthenticationServiceFirebase());

  // Register ViewModels

  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel());

  // Local Storage Service Provider
  locator.registerLazySingleton<LocalStorageServiceProvider>(
      () => LocalStorageServiceProvider());
// customer service locator
  locator.registerLazySingleton<CustomerServiceFirebase>(
      () => CustomerServiceFirebase());
  //barber service locator
  locator.registerLazySingleton<BarbarFirebaseSerivce>(
      () => BarbarFirebaseSerivce());
  //prefs service locator
  locator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());
}

var localStorageServiceProvider = locator<LocalStorageServiceProvider>();
var customerServiceFirebase = locator<CustomerServiceFirebase>();
var barbarFirebaseSerivce = locator<BarbarFirebaseSerivce>();
var authenticationServiceFirebase = locator<AuthenticationServiceFirebase>();
