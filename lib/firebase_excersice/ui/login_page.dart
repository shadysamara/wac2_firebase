import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/ui/register_page.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class LoginScreen extends StatelessWidget {
  String email;
  String password;

  setEmail(String value) {
    this.email = value;
  }

  setPassword(String value) {
    this.password = value;
  }

  nullValidation(String value) {
    if (value.length == 0) {
      return 'Required field';
    }
  }

  login() {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      FirebaseHelper.firebaseHelper.loginUser(email, password);
    }
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Container(
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: 'Email',
                saveFunction: setEmail,
                validationFunction: nullValidation,
              ),
              CustomTextField(
                labelText: 'Password',
                saveFunction: setPassword,
                validationFunction: nullValidation,
              ),
              TextButton(
                  onPressed: () {
                    AppRouter.router
                        .pushReplacementToNewWidget(RegisterScreen());
                  },
                  child: Text('Create new user')),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
