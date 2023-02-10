import 'package:front_end/src/core/data/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<DataState<UserCredential>> login(String email, String password);
}
