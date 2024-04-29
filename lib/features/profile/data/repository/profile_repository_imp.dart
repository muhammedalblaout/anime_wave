import 'dart:io';

import 'package:anime_wave/core/entites/user.dart';

import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/features/profile/data/datasource/profile_datesource.dart';

import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/user_model.dart';
import '../../domin/repository/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository{
  ProfileDatasource profileDatasource;

  ProfileRepositoryImp(this.profileDatasource);

  @override
  Future<Either<Failures, User>> getProfile() async {
    try {

      final user = await profileDatasource.GetMyProfile();
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

  @override
  Future<Either<Failures, UserModel>> uploadImage({required File image,required User user}) async{
    try{
      final image_url=await profileDatasource.uploadImage(image: image, id: user.id, isupdate: user.isAvaterChange,);
      UserModel userModel =UserModel(name: user.name, email: user.email, id: user.id, avatarurl: image_url,isAvaterChange: true);


      final res= await profileDatasource.updateUser(userModel);

      return Right(res);
    }
    on ServerExcepiton  catch(e){
      return Left(Failures(e.massage));

    }
  }

  @override
  Future<Either<Failures, User>> upadateUser({required User user}) async {
    try{
      UserModel userModel =UserModel(name: user.name, email: user.email, id: user.id, avatarurl: user.avatarurl,isAvaterChange: user.isAvaterChange);


      final res= await profileDatasource.updateUser(userModel);

      return Right(res);
    }
    on ServerExcepiton  catch(e){
      return Left(Failures(e.massage));

    }
  }

  @override
  Future<Either<Failures, String>> Logout() async{
    try{


      final res= await profileDatasource.logout();

      return Right(res);
    }
    on ServerExcepiton  catch(e){
      return Left(Failures(e.massage));

    }
  }

}