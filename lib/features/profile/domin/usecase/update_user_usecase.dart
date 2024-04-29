import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class UpdateUserUsecase implements Usecase<User,UpdateUserParams>{
  ProfileRepository profileRepository;
  UpdateUserUsecase(this.profileRepository);

  @override
  Future<Either<Failures, User>> call(UpdateUserParams params) async {
    return await profileRepository.upadateUser( user: params.user);
  }

}

class UpdateUserParams{
  final User user;

  const UpdateUserParams({
    required this.user,
  });

}