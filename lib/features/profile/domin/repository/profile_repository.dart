import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';

abstract interface class ProfileRepository{

  Future<Either<Failures,User>> getProfile();
  Future<Either<Failures, User>> uploadImage({required File image,required User user});
  Future<Either<Failures, User>> upadateUser({required User user});
  Future<Either<Failures, String>> Logout();


}