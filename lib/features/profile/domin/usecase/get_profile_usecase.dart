import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';


class GetProfileUsecase implements Usecase<User,NoParams>{
  ProfileRepository profileRepository;
  GetProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failures, User>> call(NoParams params) async {
   return await profileRepository.getProfile();
  }

}
