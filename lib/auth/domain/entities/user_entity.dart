import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int?   id;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? birthDate;
  final String? email;
  final String? nationalIdNumber;
  final String? gender;


 const UserEntity(
      {this.id,
      this.firstName,
      this.mobile,
      this.birthDate,
      this.email,
      this.nationalIdNumber,
      this.lastName,
      this.gender
      });
  @override
  List<Object?> get props => [
        id,
        firstName,
        mobile,
        birthDate,
        email,
        nationalIdNumber,
        lastName,
        gender,
      ];
}
