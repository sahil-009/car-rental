import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/car_list_screen.dart';
import 'screens/car_details_screen.dart';
import 'screens/booking_form_screen.dart';
import 'screens/confirmation_screen.dart';

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case "/signup":
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case "/cars":
        return MaterialPageRoute(builder: (_) => const CarListScreen());
      case "/car-details":
        return MaterialPageRoute(builder: (_) => const CarDetailsScreen());
      case "/booking":
        return MaterialPageRoute(builder: (_) => const BookingFormScreen());
      case "/confirmation":
        return MaterialPageRoute(builder: (_) => const ConfirmationScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
