import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/app_images.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (ctx, state) {
        if (state is SplashEnded) {
          Navigator.popAndPushNamed(context,state.route);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.blueColors, AppColors.blueLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.splashLogo,
                  width: 120.w,
                  height: 120.h,
                ),
              ),
              Text(
                "Cloud Payment",
                style: AppStyle.poppins24xW500White,
              )
            ],
          ),
        ),
      ),
    );
  }
}
