import 'dart:io';

import 'package:wac2_firebase/firebase_excersice/helpers/auth_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestorage_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/models/user_model.dart';
import 'package:wac2_firebase/firebase_excersice/ui/home_page.dart';
import 'package:wac2_firebase/firebase_excersice/ui/login_page.dart';
import 'package:wac2_firebase/firebase_excersice/ui/profile_page.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/globals.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class FirebaseHelper {
  FirebaseHelper._();
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  registerUser(UserModel userModel) async {
    String userId = await AuthHelper.authHelper
        .register(userModel.email, userModel.password);
    FirestoreHelper.firestoreHelper.createNewUser(userModel, userId);
    getCurrentUser();
  }

  loginUser(String email, String password) async {
    String userId = await AuthHelper.authHelper.login(email, password);
    FirestoreHelper.firestoreHelper.getUser(userId);
  }

  getCurrentUser() async {
    String userid = AuthHelper.authHelper.getCurrentUserId();
    if (userid != null) {
      await FirestoreHelper.firestoreHelper.getUser(userid);
      AppRouter.router.pushReplacementToNewWidget(ProfilePage());
    } else {
      AppRouter.router.pushReplacementToNewWidget(LoginScreen());
    }
  }

  updateUserImage(File file) async {
    String userId = Globals.globals.userModel.id;
    String imageUrl =
        await FirestorageHelper.firestorageHelper.uploadImage(file);
    await FirestoreHelper.firestoreHelper.insertImage(imageUrl, userId);
    getCurrentUser();
  }

  logout() {
    AuthHelper.authHelper.logout();
    AppRouter.router.pushReplacementToNewWidget(LoginScreen());
  }
}
