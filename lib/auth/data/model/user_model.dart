import 'package:bus/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? birthDate,
    String? email,
    String? nationalIdNumber,
    String? gender,
  }) : super(
          id: id,
          firstName: firstName,
          mobile: mobile,
          birthDate: birthDate,
          email: email,
          nationalIdNumber: nationalIdNumber,
          lastName: lastName,
          gender: gender,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["full_name"],
      mobile: json["mobile_number"],
      birthDate: json["date_of_birth"],
      email: json["email"],
      nationalIdNumber: json["national_id_number"],
      lastName: json["lastName"],
      gender: json["gender"],
    );
  }
}
