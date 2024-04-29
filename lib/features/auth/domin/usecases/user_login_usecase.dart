import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserLoginUsecase implements Usecase<User,UserloginParams>{
  final AuthRepository authRepository;

  UserLoginUsecase(this.authRepository);

  @override
  Future<Either<Failures, User>> call(UserloginParams params) async {
    return await authRepository.loginWithEmailPassword(email: params.email, Password: params.Password);

  }

}
class UserloginParams{
  final String email;
  final String Password;

  UserloginParams({required this.email, required this.Password});

}
