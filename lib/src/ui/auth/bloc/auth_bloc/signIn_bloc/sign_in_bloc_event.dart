part of 'sign_in_bloc_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignOut extends SignInEvent {
  @override
  List<Object?> get props => [];
}
