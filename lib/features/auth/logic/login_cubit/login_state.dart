part of 'login_cubit.dart';

abstract class LogInState {}

class AuthInitial extends LogInState {}

class AuthLoading extends LogInState {}

class AuthSuccess extends LogInState {
  final String message;

  AuthSuccess({required this.message});
}

class AuthError extends LogInState {
  final String error;
  AuthError(this.error);
}

class AuthChangeVisability extends LogInState {}
