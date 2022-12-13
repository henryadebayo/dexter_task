import 'package:dexter_task/src/ui/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServicesHelper {
  AuthServices services = AuthServices();

  Future<String?> callSignIn(
      {required String email, required String password}) async {
    try {
      await services.signInUser(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> callSignUp(
      {required String email, required String password}) async {
    try {
      await services.signUpUser(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> callSignOut() async {
    try {
      await services.signOutUser();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
