import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';


class CurrentUserUsecase implements Usecase<User,NoParams>{
  AuthRepository authRepository;

  CurrentUserUsecase(this.authRepository);

  @override
  Future<Either<Failures, User>> call(NoParams params) {
   return authRepository.currentUser();
  }

}
