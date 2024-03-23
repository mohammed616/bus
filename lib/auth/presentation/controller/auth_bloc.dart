import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bus/auth/domain/usecases/login_usecase.dart';
import 'package:bus/auth/domain/usecases/register_usecase.dart';
import 'package:bus/auth/presentation/controller/auth_state.dart';
import 'package:bus/core/error/failure.dart';
import 'package:bus/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUseCase registerUseCase;

  AuthBloc(
    this.loginUsecase,
    this.registerUseCase,
  ) : super(const AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginState: RequestState.loading));
      final result = await loginUsecase(
          LoginParameters(phone: event.phone, password: event.password));

      result.fold(
        (l) => emit(state.copyWith(
          loginState: RequestState.error,
          loginMessage: l.message,
        )),
        (r) => emit(state.copyWith(loginState: RequestState.loaded)),
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(registerState: RequestState.loading));
      final result = await registerUseCase(RegisterParameters(
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
        gender: event.gender,
        birthDate: event.birthDate,
        mobile: event.mobile,
        nationalIdNumber: event.nationalIdNumber,
      ));

      result.fold(
        (l) => emit(state.copyWith(
          registerState: RequestState.error,
          registerMessage: l.message,
        )),
        (r) => emit(state.copyWith(registerState: RequestState.loaded)),
      );
    });
    on<ClearLoginMessageEvent>((event, emit) async {
      emit(state.copyWith(loginMessage: ''));
    });
  }
}

// // Future login(String phone,String password) async {
// //   final result =
// //       await loginUsecase(LoginParameters(phone: phone, password: password));
// //
// //   result.fold(
// //     (l) => emit(state.copyWith(
// //       loginState: RequestState.error,
// //       loginMessage: l.message,
// //     )),
// //     (r) => emit(state.copyWith(loginState: RequestState.loaded)),
// //   );
// // }
//
// Future register(RegisterEvent event, Emitter<AuthState> emit) async {
//   final result = await registerUseCase(RegisterParameters(
//     firstName: '',
//     lastName: '',
//     email: '',
//     password: '',
//     confirmPassword: '',
//     gender: '',
//     birthDate: '',
//     mobile: '',
//     nationalIdNumber: '',
//   ));
//
//   result.fold(
//         (l) =>
//         emit(state.copyWith(
//           registerState: RequestState.error,
//           registerMessage: l.message,
//         )),
//         (r) => emit(state.copyWith(registerState: RequestState.loaded)),
//   );
// }
