import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String id;
  String imageUrl;
  String email;
  String password;
  String city;
  String fullName;
  String phoneNumber;
  bool isAdmin;
  UserModel({
    this.id,
    this.imageUrl,
    this.isAdmin = false,
    @required this.email,
    @required this.password,
    @required this.city,
    @required this.fullName,
    @required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'city': city,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'isAdmin': this.isAdmin
    };
  }

  UserModel.fromDocumentSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    this.id = documentSnapshot.id;
    this.imageUrl = documentSnapshot.data()['imageUrl'];
    this.email = documentSnapshot.data()['email'];
    this.city = documentSnapshot.data()['city'];
    this.fullName = documentSnapshot.data()['fullName'];
    this.phoneNumber = documentSnapshot.data()['phoneNumber'];
    this.isAdmin = documentSnapshot.data()['isAdmin'];
  }
}
