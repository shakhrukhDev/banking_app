import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_cards_event.dart';
part 'my_cards_state.dart';

class MyCardsBloc extends Bloc<MyCardsEvent, MyCardsState> {
  MyCardsBloc() : super(MyCardsInitial()) {
    on<MyCardsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
