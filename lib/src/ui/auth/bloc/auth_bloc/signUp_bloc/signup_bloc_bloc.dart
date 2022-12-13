import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../auth_services.dart';
import '../../../models/user_model.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpBlocState> {
  SignUpBloc() : super(SignupBlocInitial()) {
    on<SignUp>(_signUpEvent);
  }

  FutureOr<void> _signUpEvent(
      SignUp event, Emitter<SignUpBlocState> emit) async {
    try {
      emit(SignUpLoading());
      final authServices = AuthServices();
      final user = await authServices.signUpUser(
          password: event.password, email: event.email);
      emit(
        SignedUpSuccessful(message: "success"),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        SignedUpError(errorMessage: e.message),
      );
    } on SocketException {
      emit(
        SignedUpError(errorMessage: "Check Internet Connection"),
      );
    } catch (e) {
      String errorMessage = "";
      if (e == null) {
        errorMessage = "Phone Number Already Exist";
      } else {
        errorMessage = e.toString();
      }
      emit(
        SignedUpError(errorMessage: errorMessage),
      );
      print(e.toString());
    }
  }
}
