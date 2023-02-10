import 'package:front_end/src/core/data/data_state.dart';
import 'package:front_end/src/core/usecase/usecase.dart';
import 'package:front_end/src/features/login/domain/repository/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase extends UseCase<DataState<UserCredential>, LoginParam> {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);
  @override
  Future<DataState<UserCredential>> call(LoginParam params) {
    return _loginRepo.login(params.email, params.password);
  }
}

class LoginParam {
  final String email;
  final String password;

  LoginParam(this.email, this.password);
}
