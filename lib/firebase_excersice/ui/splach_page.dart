import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_provider.dart';
import 'package:wac2_firebase/firebase_excersice/customer/customer_provider.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/auth_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CustomerProvider>(context, listen: false).getCategories();
    Provider.of<CustomerProvider>(context, listen: false).getSliders();
    Future.delayed(Duration.zero).then((value) =>
        Provider.of<AuthProvider>(context, listen: false).getCurrentUser());
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
