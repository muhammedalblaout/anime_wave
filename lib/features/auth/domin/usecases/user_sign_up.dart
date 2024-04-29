import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserSignUp implements Usecase<User,UserSignUpParams>{
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failures, User>> call(UserSignUpParams params) async {
   return await authRepository.signupWithEmailPassword(name: params.name, email: params.email, Password: params.password);
  }

}
class UserSignUpParams{
  final String email;
  final String name;
  final String password;

  UserSignUpParams({required this.email, required this.name, required this.password});
}