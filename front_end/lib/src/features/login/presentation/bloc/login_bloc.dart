import 'dart:developer';

import 'package:front_end/src/core/data/data_state.dart';
import 'package:front_end/src/features/login/domain/usecase/login_use_case.dart';
import 'package:front_end/src/features/login/presentation/bloc/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/ui_state.dart';

class LoginCubit extends Cubit<UIState> {
  LoginCubit(this._loginUseCase) : super(UIInitialState());

  final LoginUseCase _loginUseCase;

  void login(String email, String password) async {
    emit(const OnLoginState());
    final data = await _loginUseCase.call(LoginParam(email, password));
    if (data is DataSuccessState && data.data != null) {
      emit(LoginSuccessState(data.data!));
    } else if (data.exception != null) {
      emit(LoginFailedState(data.exception!));
    }
  }
}
