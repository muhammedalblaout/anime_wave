
import 'package:anime_wave/core/commen/consts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/user_model.dart';

abstract interface class AuthRemoteDataSource{
Session? get currentUserSession;
  Future<UserModel>signupWithEmailPassword({
    required String name ,
    required String email ,
    required String Password});

  Future<UserModel>loginWithEmailPassword({
    required String email ,
    required String Password});
  Future<UserModel?>getCurrentUserData();
  

}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String Password}) async{
    try{
      final res=await supabaseClient.auth.signInWithPassword(password: Password,email:email);
      if(res==null){
        throw ServerExcepiton("User Not found");
      }
      return UserModel.fromJson(res.user!.toJson());


    }
    on PostgrestException catch(e){
      throw ServerExcepiton(e.message);

    }
    on AuthException catch (e){
      throw e;
    }
    on ServerExcepiton catch(e){
      throw ServerExcepiton(e.toString());
    }
  }

  @override
  Future<UserModel> signupWithEmailPassword({required String name, required String email, required String Password}) async {
   try{
     final respons= await supabaseClient.auth.signUp(
       password: Password,
       email: email,
       data: {
         'user_name':name,
         'avatar_url':AppConst.avatarDUrl
       });
     if (respons.user==null){
       throw ServerExcepiton("User is null");
     }
     return UserModel.fromJson(respons.user!.toJson());

   }
   on AuthException catch (e){
     throw e;
   }
   on ServerExcepiton catch(e){
     throw ServerExcepiton(e.toString());
   }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try{
     if( currentUserSession!=null){
       final userData= await supabaseClient.from("profiles").select("").eq("id", currentUserSession!.user.id);
       return UserModel.fromJson(userData.first).copyWith(email: currentUserSession!.user.email, );
     }
     return null;
      
    }
    on PostgrestException catch(e){
      throw ServerExcepiton(e.message);

    }
    on AuthException catch (e){
      throw e;
    }
    on ServerExcepiton catch(e){
      throw ServerExcepiton(e.toString());
    }
    
  }

  

}