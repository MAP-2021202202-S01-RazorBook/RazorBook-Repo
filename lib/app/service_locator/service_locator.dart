import 'package:get_it/get_it.dart';
import 'package:razor_book/services/booking/booking_service.dart';
import 'package:razor_book/services/customer/customer_service_firebase.dart';
import 'package:razor_book/services/local_storage_service/local_storage_service.dart';
import 'package:razor_book/services/local_storage_service/sharedpref_service.dart';
import 'package:razor_book/view_model/barber_profile_view_model.dart';
import 'package:razor_book/view_model/customer_profile_view_model.dart';
import 'package:razor_book/view_model/shop_view_model.dart';

import '../../services/authentication/authentication_service.dart';
import '../../services/authentication/authentication_service_firebase.dart';
import '../../services/barber_services/barber_services_service.dart';
import '../../services/barber_services/barber_services_service_firebase.dart';
import '../../services/barbershop_profile/barbershop_profile_service.dart';
import '../../services/barbershop_profile/barbershop_profile_service_firebase.dart';
import '../../services/booking/booking_service_firebase.dart';
import '../../services/customer/customer_service.dart';
import '../../services/initializer/service_initializer.dart';
import '../../services/initializer/service_initializer_firebase.dart';
import '../../view_model/bookings_view_model.dart';
import '../../view_model/forgot_password_view_model.dart';
import '../../view_model/login_view_model.dart';
import '../../view_model/barber_registration_view_model.dart';
import '../../view_model/customer_registration_view_model.dart';
import '../../view_model/services_view_model.dart';
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

  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceFirebase());

  locator.registerLazySingleton<BookingService>(() => BookingServiceFirebase());

  locator.registerLazySingleton<BarberServicesService>(
      () => BarberServicesServiceFirebase());

  locator
      .registerLazySingleton<CustomerService>(() => CustomerServiceFirebase());

  locator.registerLazySingleton<BarbershopService>(
      () => BarbershopServiceFirebase());

  // Register ViewModels

  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel());

  locator.registerLazySingleton<BarbershopSignUpViewModel>(
      () => BarbershopSignUpViewModel());

  locator.registerLazySingleton<CustomerSignUpViewModel>(
      () => CustomerSignUpViewModel());

  locator.registerLazySingleton<BookingsViewModel>(() => BookingsViewModel());

  locator.registerLazySingleton<ServicesViewModel>(() => ServicesViewModel());
  locator.registerLazySingleton<CustomerProfileViewModel>(
      () => CustomerProfileViewModel());

  locator.registerLazySingleton<BarberProfileViewModel>(
      () => BarberProfileViewModel());

  // Local Storage Service Provider
  locator.registerLazySingleton<LocalStorageServiceProvider>(
      () => LocalStorageServiceProvider());

  //prefs service locator
  locator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());

  locator.registerLazySingleton<ShopViewModelProvider>(
      () => ShopViewModelProvider());
}
