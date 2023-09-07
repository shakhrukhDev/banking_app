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
          appBar: AppBar(title: Text("Cash Flow Page"),),
        );
      },
    );
  }
}
