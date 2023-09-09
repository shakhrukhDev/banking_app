import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/language/language_page.dart';
import 'package:banking_app/presentation/auth/login/login%20_page.dart';
import 'package:banking_app/presentation/auth/register/sign_up_page.dart';
import 'package:banking_app/presentation/main/home/add_card_page/add_card_page.dart';
import 'package:banking_app/presentation/main/home/my_cards/my_cards_page.dart';
import 'package:banking_app/presentation/main/main/main_page.dart';
import 'package:banking_app/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => SigUpPage(),
        );
      case RoutesName.main:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case RoutesName.myCards:
        return MaterialPageRoute(
          builder: (context) => const MyCardsPage(),
        );
      case RoutesName.addCard:
        return MaterialPageRoute(
          builder: (context) => const AddCardPagePage(),
        );
      case RoutesName.language:
        return MaterialPageRoute(
          builder: (context) => const LanguagePage(),
        );
    }
    return null;
  }
}