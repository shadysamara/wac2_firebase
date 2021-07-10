import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/auth_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero)
        .then((value) => FirebaseHelper.firebaseHelper.getCurrentUser());
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              AuthHelper.authHelper.logout();
            },
            child: FlutterLogo()),
      ),
    );
  }
}
