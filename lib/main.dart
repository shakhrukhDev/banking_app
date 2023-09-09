import 'package:banking_app/firebase_options.dart';
import 'package:banking_app/language/bloc/language_bloc.dart';
import 'package:banking_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:banking_app/presentation/auth/register/bloc/signup_bloc.dart';
import 'package:banking_app/presentation/main/cash_flow/bloc/cash_flow_bloc.dart';
import 'package:banking_app/presentation/main/home/add_card_page/bloc/add_card_page_bloc.dart';
import 'package:banking_app/presentation/main/home/bloc/home_bloc.dart';
import 'package:banking_app/presentation/main/home/my_cards/bloc/my_cards_bloc.dart';
import 'package:banking_app/presentation/main/main/bloc/main_bloc.dart';
import 'package:banking_app/presentation/main/payment/bloc/payment_bloc.dart';
import 'package:banking_app/presentation/main/services/bloc/services_bloc.dart';
import 'package:banking_app/presentation/main/transfer/bloc/transfer_bloc.dart';
import 'package:banking_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:banking_app/presentation/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'constants/routes/app_routes.dart';
import 'constants/routes/routes_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SplashBloc()..add(SplashInitialEvent())),
      BlocProvider(create: (_)=>LoginBloc()),
      BlocProvider(create: (_)=>SignupBloc()),
      BlocProvider(create: (_)=>MainBloc()),
      BlocProvider(create: (_)=>HomeBloc()),
      BlocProvider(create: (_)=>TransferBloc()),
      BlocProvider(create: (_)=>PaymentBloc()),
      BlocProvider(create: (_)=>ServicesBloc()),
      BlocProvider(create: (_)=>CashFlowBloc()),
      BlocProvider(create: (_)=>AddCardPageBloc()),
      BlocProvider(create: (_)=>MyCardsBloc()),
      BlocProvider(create: (_)=>LanguageBloc()),
    ], child: KeyboardDismisser(
      child: ScreenUtilInit(
          child: MaterialApp(
            /*  localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,*/
            builder: EasyLoading.init(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          )
      ),
    ));
  }
}