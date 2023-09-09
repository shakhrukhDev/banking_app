import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_card_page_event.dart';
part 'add_card_page_state.dart';

class AddCardPageBloc extends Bloc<AddCardPageEvent, AddCardPageState> {
  AddCardPageBloc() : super(AddCardPageInitial()) {
    on<AddCardPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
