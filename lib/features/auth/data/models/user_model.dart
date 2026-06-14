import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,


  });

  factory UserModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;
    return UserModel(
      id: data['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,

    };
  }
}
