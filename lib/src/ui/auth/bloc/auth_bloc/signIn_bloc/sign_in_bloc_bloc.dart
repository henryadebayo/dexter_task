import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../auth_services.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignIn>(_handleSignIn);
    on<SignOut>(_handleSignOut);
  }

  FutureOr<void> _handleSignIn(SignIn event, Emitter<SignInState> emit) async {
    _handleSignIn;
    try {
      await AuthServices()
          .signInUser(email: event.email, password: event.password);
    } on FirebaseAuthException catch (e) {
      return emit(
        SignInError(errorMsg: e.message),
      );
    } on SocketException {
      emit(SignInError(errorMsg: "Check Internet Connection"));
    } catch (e) {
      String errorMessage = "";
      if (e == null) {
        errorMessage = "Invalid login credentials";
      } else {
        errorMessage = e.toString();
      }
      emit(
        SignInError(errorMsg: errorMessage),
      );
      print(e.toString());
    }
  }

  FutureOr<void> _handleSignOut(
      SignOut event, Emitter<SignInState> emit) async {
    final authServices = AuthServices();
    await authServices.signOutUser();
  }

  FutureOr<void> _handleSignedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return emit(SignInSuccessful());
    } else {
      return emit(SignInInitial());
    }
  }
}
