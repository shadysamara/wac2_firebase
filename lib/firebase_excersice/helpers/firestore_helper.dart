import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/auth_helper.dart';
import 'package:wac2_firebase/firebase_excersice/models/user_model.dart';
import 'package:wac2_firebase/firebase_excersice/ui/home_page.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/globals.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  createNewUser(UserModel userModel, String userId) async {
    firestore.collection('Users').doc(userId).set(userModel.toMap());
  }

  exitApp() async {
    Globals.globals.userModel = null;
  }

  Future<UserModel> getUser(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('Users').doc(userId).get();
    UserModel userModel = UserModel.fromDocumentSnapShot(documentSnapshot);
    Globals.globals.userModel = userModel;

    return userModel;
  }

  insertImage(String imageUrl, String id) async {
    firestore.collection('Users').doc(id).update({'imageUrl': imageUrl});
  }
}
