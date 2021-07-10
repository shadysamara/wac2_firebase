// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserModel {
//   String id;
//   String email;
//   String password;
//   String firstName;
//   String lastName;
//   String city;
//   UserModel({
//     this.id,
//     @required this.email,
//     @required this.password,
//     @required this.firstName,
//     @required this.lastName,
//     @required this.city,
//   });
//   UserModel.fromDocumentSnapShot(
//       DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
//     this.email = documentSnapshot.data()['email'];
//     this.city = documentSnapshot.data()['city'];
//     this.firstName = documentSnapshot.data()['fName'];
//     this.lastName = documentSnapshot.data()['lName'];
//     this.id = documentSnapshot.id;
//   }
//   toMap() {
//     return {
//       'fName': this.firstName,
//       'lName': this.lastName,
//       'city': this.city,
//       'email': this.email,
//       'id': this.id,
//     };
//   }
// }
