part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccses extends AuthState {
  final User user;
  AuthSuccses(this.user);

}

final class AuthFailure extends AuthState {
  final String massage;
  AuthFailure(this.massage);
}


