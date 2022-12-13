part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class SignUp extends SignupEvent {
  final String email;
  final String password;

  SignUp({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
