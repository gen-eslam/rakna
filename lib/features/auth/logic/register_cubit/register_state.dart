part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}

class EmailVerified extends RegisterState {
    final String message;

  EmailVerified({required this.message});
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
}
// AuthSuccess

class AuthSuccess extends RegisterState {
  final String message;
  AuthSuccess({required this.message});
}

class AuthError extends RegisterState {
  final String error;
  AuthError(this.error);
}
//AuthLoading

class AuthLoading extends RegisterState {}
