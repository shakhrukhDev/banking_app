import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/cash_flow/bloc/cash_flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashFlowPage extends StatelessWidget {
  const CashFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashFlowBloc, CashFlowState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:  AppColors.blueColors,
            title: Text(
              "Cash Flow",
              style: AppStyle.poppins20xW400White,
            ),
            automaticallyImplyLeading: false,
          ),
        );
      },
    );
  }
}
