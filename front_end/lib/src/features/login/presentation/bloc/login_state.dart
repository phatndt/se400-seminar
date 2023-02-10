import 'package:front_end/src/core/bloc/ui_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSuccessState extends UIState {
  final UserCredential userCredential;

  const LoginSuccessState(this.userCredential);
}

class LoginFailedState extends UIState {
  final Exception exception;

  const LoginFailedState(this.exception);
}

class OnLoginState extends UIState {
  const OnLoginState();
}

