part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
class GetProfileEvent extends ProfileEvent{

}

final class UpdateImageEvent extends ProfileEvent {
  final File image;
  final User user;


  UpdateImageEvent({
    required this.image,
    required this.user,

  });
}

final class UpdateProfileEvent extends ProfileEvent {
  final User user;


  UpdateProfileEvent({
    required this.user,

  });
}

final class LogoutEvent extends ProfileEvent {


}