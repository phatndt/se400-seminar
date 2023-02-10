import 'package:front_end/src/features/login/domain/repository/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data/data_state.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<DataState<UserCredential>> login(String email, String password) async {
    await FirebaseAuth.instance.signOut();
    try {
      final value = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return DataSuccessState(value);
    } on FirebaseAuthException catch (e) {
      return DataErrorState(Exception(getMessageFromErrorCode(e.code)));
    } catch (e) {
      return DataErrorState(Exception(e));
    }
  }
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";

    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Server error, please try again later.";

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";

    default:
      return "Login failed. Please try again.";
  }
}
