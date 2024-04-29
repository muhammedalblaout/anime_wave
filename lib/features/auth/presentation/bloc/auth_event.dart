part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
final class AuthSignUp extends AuthEvent{
  final String email;
  final String name;
  final String password;

  AuthSignUp({required this.email,required this.name,required this.password});
}
final class AuthLoginEvent extends AuthEvent{
  final String email;
  final String password;

  AuthLoginEvent({required this.email,required this.password});
}
final class AuthIsUserLoggedInEvent extends AuthEvent{

}
