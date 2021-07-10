import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/models/user_model.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int groubVale = 0;
  String email;

  String password;

  String repeatedPassword;

  String city;

  String fullName;

  String phoneNumber;

  setEmail(String value) {
    this.email = value;
  }

  setPassword(String value) {
    this.password = value;
  }

  setPassword2(String value) {
    this.repeatedPassword = value;
  }

  setCity(String value) {
    this.city = value;
  }

  setFullName(String value) {
    this.fullName = value;
  }

  setPhonenNumber(String value) {
    this.phoneNumber = value;
  }

  nullValidation(String value) {
    if (value.length == 0) {
      return 'Required field';
    }
  }

  validateRepeatedPassword(String value) {
    if (value != this.password) {
      return 'the entered passwords are not matched';
    }
  }

  register() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      UserModel userModel = UserModel(
          city: this.city,
          email: this.email,
          fullName: this.fullName,
          password: this.password,
          isAdmin: this.groubVale == 2,
          phoneNumber: this.phoneNumber);
      FirebaseHelper.firebaseHelper.registerUser(userModel);
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          title: Text('Admin'),
                          value: 2,
                          groupValue: groubVale,
                          onChanged: (value) {
                            this.groubVale = value;
                            setState(() {});
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: Text('Customer'),
                          value: 3,
                          groupValue: groubVale,
                          onChanged: (value) {
                            this.groubVale = value;
                            setState(() {});
                          }),
                    )
                  ],
                ),
                CustomTextField(
                  labelText: 'Email',
                  saveFunction: setEmail,
                  validationFunction: nullValidation,
                ),
                CustomTextField(
                  labelText: 'FullName',
                  saveFunction: setFullName,
                  validationFunction: nullValidation,
                ),
                CustomTextField(
                  labelText: 'City',
                  saveFunction: setCity,
                  validationFunction: nullValidation,
                ),
                CustomTextField(
                  labelText: 'Phone',
                  saveFunction: setPhonenNumber,
                  validationFunction: nullValidation,
                ),
                CustomTextField(
                  labelText: 'Password',
                  saveFunction: setPassword,
                  validationFunction: nullValidation,
                ),
                CustomTextField(
                  labelText: 'Repeat Password',
                  saveFunction: setPassword2,
                  validationFunction: nullValidation,
                ),
                TextButton(
                  child: Text('already have an account'),
                  onPressed: () {
                    AppRouter.router
                        .pushReplacementToNewWidget(RegisterScreen());
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
