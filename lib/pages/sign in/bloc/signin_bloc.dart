import 'dart:io';
import 'dart:convert';
import 'package:edtech/pages/sign%20in/bloc/sigin_events.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    // print("My password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    // print("My email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }
}
