part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignUpBlocState extends Equatable {}

class SignupBlocInitial extends SignUpBlocState {
  @override
  List<Object?> get props => [];
}

class SignUpLoading extends SignUpBlocState {
  @override
  List<Object?> get props => [];
}

class SignedUpSuccessful extends SignUpBlocState {
  final String? message;
  UserModel? user;
  SignedUpSuccessful({this.user, this.message});

  @override
  List<Object?> get props => [message, user];
}

class SignedUpError extends SignUpBlocState {
  final String? errorMessage;

  SignedUpError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
