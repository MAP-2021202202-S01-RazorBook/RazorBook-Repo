import 'package:flutter/material.dart';
import 'package:razor_book/router-constants.dart';
import 'package:razor_book/views/all_bookings_view.dart';
import 'package:razor_book/views/all_services_view.dart';
import 'package:razor_book/views/barbershop_screens/barbershop_main_page_nav.dart';
import 'package:razor_book/views/barbershop_screens/barbershop_profile/barbershop_view_profile_screen.dart';
import 'package:razor_book/views/customer_screens/customer_main_page_nav.dart';
import 'package:razor_book/views/forgot_password_view.dart';
import 'package:razor_book/views/home_view.dart';
import 'package:razor_book/views/login_view.dart';
import 'package:razor_book/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case '/':

      /// init route is the home page
      return MaterialPageRoute(builder: (context) => const Home());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupViewRoute:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case BarberSignupViewRoute:
      return MaterialPageRoute(builder: (context) => const BarberSignupView());
    case CustomerSignupViewRoute:
      return MaterialPageRoute(
          builder: (context) => const CustomerSignupView());
    case ForgotPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView());
    case BarberBookingsRoute:
      return MaterialPageRoute(builder: (context) => const ViewBookings());
    case BarberServicesRoute:
      return MaterialPageRoute(builder: (context) => const ViewServices());
    case BarberMainNavRoute:
      return MaterialPageRoute(builder: (context) => const BarberMainPageNav());
    case CustomerMainNavRoute:
      return MaterialPageRoute(
          builder: (context) => const CustomerMainPageNav());
    case BarberProfileRoute:
      return MaterialPageRoute(
          builder: (context) => const BarbershopProfileView());
    default:
      return MaterialPageRoute(builder: (context) => const Home());
  }
}
