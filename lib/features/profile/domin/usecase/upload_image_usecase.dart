import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class UploadImageUsecase implements Usecase<User,UploadImageParams>{
  ProfileRepository profileRepository;
  UploadImageUsecase(this.profileRepository);

  @override
  Future<Either<Failures, User>> call(UploadImageParams params) async {
    return await profileRepository.uploadImage(image: params.image, user: params.user);
  }

}

class UploadImageParams{
  final File image;
  final User user;

  const UploadImageParams({
    required this.image,
    required this.user,
  });

}