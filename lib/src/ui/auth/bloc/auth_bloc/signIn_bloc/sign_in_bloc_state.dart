part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccessful extends SignInState {
  String? message;
  SignInSuccessful({this.message});

  @override
  List<Object?> get props => [message];
}

class SignInError extends SignInState {
  String? errorMsg;
  SignInError({this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}

class SignedIn extends SignInState {
  final user = FirebaseAuth.instance.currentUser;

  SignedIn(FutureOr<void> handleSignedIn);
  @override
  List<Object?> get props => [user];
}
