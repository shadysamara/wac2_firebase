import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/ui/splach_page.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';
import 'package:wac2_firebase/helpers/auth_helper.dart';
import 'package:wac2_firebase/helpers/firestore_helper.dart';
import 'package:wac2_firebase/models/user_model.dart';
import 'package:wac2_firebase/widgets/custom_textfield.dart';

void main() {
  runApp(MateriapAppIntializing());
}

class MateriapAppIntializing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        navigatorKey: AppRouter.router.navigatorKey, home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('ERROR'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return SplachScreen();
          // return LoginScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

// class RegisterScreen extends StatelessWidget {
//   String email;
//   setEmail(String value) {
//     this.email = value;
//   }

//   String password;
//   setPassword(String value) {
//     this.password = value;
//   }

//   String fName;
//   setFName(String value) {
//     this.fName = value;
//   }

//   String lName;
//   setLName(String value) {
//     this.lName = value;
//   }

//   String city;
//   setCity(String value) {
//     this.city = value;
//   }

//   String nullValidation(String value) {
//     if (value == null || value.length == 0) {
//       return '*Required field';
//     }
//   }

//   saveUser() async {
//     if (formKey.currentState.validate()) {
//       formKey.currentState.save();
//       UserModel userModel = UserModel(
//           city: this.city,
//           email: this.email,
//           firstName: this.fName,
//           lastName: this.lName,
//           password: this.password);
//       String userId = await AuthHelper.authHelper.register(userModel);
//       userModel.id = userId;
//       FirestoreHelper.firestoreHelper.addUserToFirestore(userModel);
//     } else {
//       return;
//     }
//   }

//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: Container(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               CustomTextField('First Name', setFName, nullValidation),
//               CustomTextField('Last Name', setLName, nullValidation),
//               CustomTextField('City', setCity, nullValidation),
//               CustomTextField('Email', setEmail, nullValidation),
//               CustomTextField('Password', setPassword, nullValidation),
//               Spacer(),
//               ElevatedButton(
//                   onPressed: () {
//                     saveUser();
//                   },
//                   child: Text('Register'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String email;
//   setEmail(String value) {
//     this.email = value;
//   }

//   String password;
//   setPassword(String value) {
//     this.password = value;
//   }

//   String nullValidation(String value) {
//     if (value == null || value.length == 0) {
//       return '*Required field';
//     }
//   }

//   saveUser() async {
//     if (formKey.currentState.validate()) {
//       formKey.currentState.save();

//       String userId =
//           await AuthHelper.authHelper.login(this.email, this.password);

//       UserModel userModel =
//           await FirestoreHelper.firestoreHelper.deleteUserFromFirestore(userId);
//     } else {
//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               CustomTextField('Email', setEmail, nullValidation),
//               CustomTextField('Password', setPassword, nullValidation),
//               Spacer(),
//               ElevatedButton(
//                   onPressed: () {
//                     saveUser();
//                   },
//                   child: Text('Login'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
