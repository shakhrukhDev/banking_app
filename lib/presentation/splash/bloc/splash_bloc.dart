import 'dart:async';


import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>((event, emit) {
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        emit(SplashEnded(route: RoutesName.main));
      }else{
        emit(SplashEnded(route: RoutesName.login));
      }
    });
  }
}
