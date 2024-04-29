part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileFail extends ProfileState {
  final String massage;

  ProfileFail(this.massage);
}
final class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess(this.user);
}
final class ProfileLogOut extends ProfileState {}

