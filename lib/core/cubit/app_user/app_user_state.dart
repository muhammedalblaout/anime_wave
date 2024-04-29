import 'package:flutter/cupertino.dart';

import '../../entites/user.dart';


@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}
final class AppUserLoggin extends AppUserState {
  final User user;

  AppUserLoggin(this.user);
}

final class AppUserLogout extends AppUserState {

  AppUserLogout();
}


