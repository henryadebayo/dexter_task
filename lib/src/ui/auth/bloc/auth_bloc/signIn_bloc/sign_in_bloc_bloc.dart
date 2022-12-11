import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignIn>(_handleSignIn);
    on<SignOut>(_handleSignOut);
  }

  FutureOr<void> _handleSignIn(SignIn event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading());
      final AuthServices authServices = AuthServices();
      final user = await authServices.signIn(event.phoneNumber, event.password);
      print("THIS IS SIGN IN BLOC MESSAGE :::::${user}");
      emit(SignInSuccessful(message: user!.message));
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
    await authServices.signOut();
  }
}

class AuthServices {
  signOut() {}

  signIn(String phoneNumber, String password) {}

  signUp({required String password, required String phoneNumber}) {}
}
