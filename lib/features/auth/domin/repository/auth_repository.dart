import 'package:fpdart/fpdart.dart';
import '../../../../core/entites/user.dart';
import '../../../../core/error/failures.dart';


abstract interface class AuthRepository{
  Future<Either<Failures,User>> signupWithEmailPassword({
    required String name ,
    required String email ,
    required String Password
  });
  Future<Either<Failures,User>> loginWithEmailPassword({
    required String email ,
    required String Password
  });
  Future<Either<Failures,User>> currentUser();
}