import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/services/bloc/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:  AppColors.blueColors,
            title: Text(
              "Services",
              style: AppStyle.poppins20xW400White,
            ),
            automaticallyImplyLeading: false,
          ),
        );
      },
    );
  }
}
