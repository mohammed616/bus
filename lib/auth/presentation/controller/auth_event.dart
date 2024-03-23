part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String? phone;

  final String? password;

  const LoginEvent({this.phone, this.password});
}

class RegisterEvent extends AuthEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? gender;
  final String? birthDate;
  final String? mobile;
  final String? nationalIdNumber;

 const RegisterEvent({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.gender,
    this.birthDate,
    this.mobile,
    this.nationalIdNumber,
  });
}

class ClearLoginMessageEvent extends AuthEvent {}
