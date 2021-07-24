import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/models/user_model.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Container(
        child: Form(
          key: Provider.of<AuthProvider>(context).registerKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Selector<AuthProvider, int>(builder: (context, value, widget) {
                  return Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            title: Text('Admin'),
                            value: 1,
                            groupValue: value,
                            onChanged: (v) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .toggleIsAdmin(v);
                            }),
                      ),
                      Expanded(
                        child: RadioListTile(
                            title: Text('Customer'),
                            value: 0,
                            groupValue: value,
                            onChanged: (v) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .toggleIsAdmin(v);
                            }),
                      )
                    ],
                  );
                }, selector: (context, provider) {
                  return provider.isAdmin;
                }),
                CustomTextField(
                  controller:
                      Provider.of<AuthProvider>(context).emailController,
                  labelText: 'Email',
                  validationFunction:
                      Provider.of<AuthProvider>(context, listen: false)
                          .nullValidation,
                ),
                CustomTextField(
                  controller:
                      Provider.of<AuthProvider>(context).fullNameController,
                  labelText: 'FullName',
                  validationFunction:
                      Provider.of<AuthProvider>(context, listen: false)
                          .nullValidation,
                ),
                CustomTextField(
                  controller: Provider.of<AuthProvider>(context).cityController,
                  labelText: 'City',
                  validationFunction:
                      Provider.of<AuthProvider>(context, listen: false)
                          .nullValidation,
                ),
                CustomTextField(
                  controller:
                      Provider.of<AuthProvider>(context).phoneNumberController,
                  labelText: 'Phone',
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
                CustomTextField(
                  labelText: 'Repeat Password',
                  validationFunction:
                      Provider.of<AuthProvider>(context, listen: false)
                          .validateRepeatedPassword,
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
                      controller:
                      Provider.of<AuthProvider>(context, listen: false)
                          .registerUser();
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
