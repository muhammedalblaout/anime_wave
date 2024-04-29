import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class LogOutUsecase implements Usecase<String,NoParams>{
  ProfileRepository profileRepository;
  LogOutUsecase(this.profileRepository);

  @override
  Future<Either<Failures, String>> call(NoParams params) async {
    return await profileRepository.Logout();
  }

}