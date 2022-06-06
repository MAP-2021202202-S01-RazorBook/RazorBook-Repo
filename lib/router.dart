import 'package:flutter/material.dart';
import 'package:razor_book/router-constants.dart';
import 'package:razor_book/views/all_bookings_view.dart';
import 'package:razor_book/views/all_services_view.dart';
import 'package:razor_book/views/forgot_password_view.dart';
import 'package:razor_book/views/login_view.dart';
import 'package:razor_book/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginView());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case SignupViewRoute:
      return MaterialPageRoute(builder: (context) => SignupView());
    case BarberSignupViewRoute:
      return MaterialPageRoute(builder: (context) => BarberSignupView());
    case CustomerSignupViewRoute:
      return MaterialPageRoute(builder: (context) => CustomerSignupView());
    case ForgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordView());
    case BarberBookingsRoute:
      return MaterialPageRoute(builder: (context) => ViewBookings());
    case BarberServicesRoute:
      return MaterialPageRoute(builder: (context) => ViewServices());
    default:
      return MaterialPageRoute(builder: (context) => LoginView());
  }
}
