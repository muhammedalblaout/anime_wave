import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/user_model.dart';

abstract interface class ProfileDatasource {
  Session? get currentUserSession;

  Future<UserModel?> GetMyProfile();

  Future<String> uploadImage(
      {required File image, required String id, required bool isupdate});

  Future<UserModel> updateUser(UserModel user);
  Future<String> logout();

}

class ProfileDatasourceImp implements ProfileDatasource {
  final SupabaseClient supabaseClient;

  Session? get currentUserSession => supabaseClient.auth.currentSession;

  ProfileDatasourceImp(this.supabaseClient);

  @override
  Future<UserModel?> GetMyProfile() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from("profiles")
            .select("")
            .eq("id", currentUserSession!.user.id);
        return UserModel.fromJson(userData.first).copyWith(
          email: currentUserSession!.user.email,
        );
      }
      return null;
    } on AuthException catch (e) {
      throw e;
    } on ServerExcepiton catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }

  @override
  Future<String> uploadImage(
      {required File image, required String id, required bool isupdate}) async {
    try {
      if (isupdate) {
        await supabaseClient.storage.from("avatars").update(id, image);
      } else {
        await supabaseClient.storage.from("avatars").upload(id, image);
      }
      return supabaseClient.storage.from("avatars").getPublicUrl(id);
    } catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    try {
      print(user.avatarurl);
      if (user.email != currentUserSession?.user.email) {
        print("update email");
        await supabaseClient.auth.updateUser(
          UserAttributes(
            email: user.email,
          ),
        );
      }

      final res = await supabaseClient
          .from('profiles')
          .update(user.toJson())
          .match({"id": user.id}).select();
      print(res);

      return UserModel.fromJson(res.first);
    } catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }

  @override
  Future<String> logout() async {
    try {
      await supabaseClient.auth.signOut();
      return "logout !!";
    } catch (e) {
      throw ServerExcepiton(e.toString());
    }
  }
}
