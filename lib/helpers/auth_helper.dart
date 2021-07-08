import 'package:firebase_auth/firebase_auth.dart';
import 'package:wac2_firebase/models/user_model.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> register(UserModel userModel) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password);
    return userCredential.user.uid;
  }

  Future<String> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  signOut() async {
    firebaseAuth.signOut();
  }
}
