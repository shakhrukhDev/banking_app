import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cash_flow_event.dart';
part 'cash_flow_state.dart';

class CashFlowBloc extends Bloc<CashFlowEvent, CashFlowState> {
  CashFlowBloc() : super(CashFlowInitial()) {
    on<CashFlowEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
