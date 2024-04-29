
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart'as sb;
import '../../../../core/entites/user.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/internet_checker.dart';
import '../../domin/repository/auth_repository.dart';
import '../datasources/auth_remote_data_sourse.dart';

class AuthRepositoryImp implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSourse;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImp(this.authRemoteDataSourse,this.connectionChecker);

  @override
  Future<Either<Failures, User>> loginWithEmailPassword({required String email, required String Password}) async {

      return _getUser(() async =>await authRemoteDataSourse.loginWithEmailPassword(
          email: email, Password: Password));

  }


  @override
  Future<Either<Failures, User>> signupWithEmailPassword ({required String name, required String email, required String Password}) async {

      return _getUser(() async => await authRemoteDataSourse.signupWithEmailPassword(
          name: name, email: email, Password: Password));

  }
  Future<Either<Failures, User>> _getUser(Future<User> Function() fn)async{
    try {
      if(! await connectionChecker.isConnecred){
        return left(Failures("No Internet Connection"));
      }
      await fn();
      final user = await authRemoteDataSourse.getCurrentUserData();


      return right(user!);
    }  on sb.AuthException catch(e){
      return left(Failures(e.message));

    }
    on ServerExcepiton catch(e){
      return left(Failures(e.massage));

    }
  }

  @override
  Future<Either<Failures, User>> currentUser() async {
    try {

      final user = await authRemoteDataSourse.getCurrentUserData();
      if(user==null){
        return left(Failures("User is not logged in!"));

      }
      return Right(user);

    }  on sb.AuthException catch(e){
      return left(Failures(e.message));

    }
    on ServerExcepiton catch(e){
      return left(Failures(e.massage));

    }
  }


}