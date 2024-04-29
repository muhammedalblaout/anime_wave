
import '../entites/user.dart';

class UserModel extends User{
  UserModel( {required super.name, required super.email, required super.id,required super.avatarurl, required super.isAvaterChange,});
  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(name: map["user_name"]??"",
        email: map["email"]??"",
        id: map["id"]??'',
      avatarurl:map["avatar_url"]??'https://via.placeholder.com/150',
        isAvaterChange: map["isAvatarChange"]??false
    );
  }
  UserModel copyWith({ String? name, String? email,  String? id,String? avatarurl,bool? isAvaterChange}) {
    return UserModel(
        id: id ?? this.id, email: email ?? this.email, name: name ?? this.name, avatarurl: avatarurl?? this.avatarurl, isAvaterChange: isAvaterChange??this.isAvaterChange);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': this.name,
      'avatar_url': this.avatarurl,
    };
  }
}