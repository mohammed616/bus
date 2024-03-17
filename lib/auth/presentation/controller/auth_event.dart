part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent{
  final String? phone ;
  final String? password ;
  const LoginEvent({  this.phone ,  this.password});
}

class RegisterEvent extends AuthEvent{}

