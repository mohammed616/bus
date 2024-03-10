import 'package:bus/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final RequestState loginState;
  final String loginMessage;

  final RequestState registerState;
  final String registerMessage;

  const AuthState({
    this.loginState = RequestState.loading,
    this.loginMessage = '',
    this.registerState = RequestState.loading,
    this.registerMessage = '',
  });

  AuthState copyWith({
    RequestState? loginState,
    String? loginMessage,
    RequestState? registerState,
    String? registerMessage,
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,
      registerState: registerState ?? this.registerState,
      registerMessage: registerMessage ?? this.registerMessage,
    );
  }

  @override
  List<Object> get props => [
        loginState,
        loginMessage,
        registerState,
        registerMessage,
      ];
}
