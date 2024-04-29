
class User{
  final String name;
  final String email;
  final String id;
  final String avatarurl;
  final bool isAvaterChange;

  User({required this.name, required this.email, required this.id,required this.avatarurl,required this.isAvaterChange});

  User copyWith({
    String? name,
    String? email,
    String? id,
    String? avatarurl,
    bool? isAvaterChange,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      avatarurl: avatarurl ?? this.avatarurl,
      isAvaterChange: isAvaterChange ?? this.isAvaterChange,
    );
  }
}