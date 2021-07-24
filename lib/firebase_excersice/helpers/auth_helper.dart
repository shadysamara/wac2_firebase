import 'package:firebase_auth/firebase_auth.dart';
import 'package:wac2_firebase/models/user_model.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User> register(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  logout() async {
    await firebaseAuth.signOut();
  }

  User getCurrentUserId() {
    return firebaseAuth.currentUser;
  }
}
