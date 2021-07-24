import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';
import 'package:wac2_firebase/firebase_excersice/ui/register_page.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Container(
        child: Form(
          key: Provider.of<AuthProvider>(context, listen: false).loginKey,
          child: Column(
            children: [
              CustomTextField(
                controller: Provider.of<AuthProvider>(context).emailController,
                labelText: 'Email',
                validationFunction:
                    Provider.of<AuthProvider>(context, listen: false)
                        .nullValidation,
              ),
              CustomTextField(
                controller:
                    Provider.of<AuthProvider>(context).passwordController,
                labelText: 'Password',
                validationFunction:
                    Provider.of<AuthProvider>(context, listen: false)
                        .nullValidation,
              ),
              TextButton(
                  onPressed: () {
                    AppRouter.router
                        .pushReplacementToNewWidget(RegisterScreen());
                  },
                  child: Text('Create new user')),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).login();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
