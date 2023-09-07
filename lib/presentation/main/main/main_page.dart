import 'package:banking_app/constants/app_icon.dart';
import 'package:banking_app/presentation/main/cash_flow/cash_flow_page.dart';
import 'package:banking_app/presentation/main/home/home_page.dart';
import 'package:banking_app/presentation/main/main/bloc/main_bloc.dart';
import 'package:banking_app/presentation/main/payment/payment_page.dart';
import 'package:banking_app/presentation/main/services/services_page.dart';
import 'package:banking_app/presentation/main/transfer/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return  Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: const [
              HomePage(),
              TransferPage(),
              PaymentPage(),
              ServicesPage(),
              CashFlowPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomMenu.index,
            onTap: (index) {
              context.read<MainBloc>().add(
                BottomMenuEvent(
                  menu: BottomMenu.values[index],
                ),
              );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.trending_flat_outlined), label: 'Transfer'),
              BottomNavigationBarItem(icon: Icon(Icons.payment_rounded), label: 'Payment'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet),label: 'Services'),
              BottomNavigationBarItem(icon: Icon(Icons.history),label: 'Cash flow'),
            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
