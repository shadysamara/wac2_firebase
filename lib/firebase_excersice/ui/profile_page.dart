import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/globals.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseHelper.firebaseHelper.logout();
            },
          )
        ],
        title: Text(Globals.globals.userModel.fullName),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Visibility(
                visible: Globals.globals.userModel.isAdmin,
                child: Icon(Icons.settings)),
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                await FirebaseHelper.firebaseHelper
                    .updateUserImage(File(pickedFile.path));
                setState(() {});
              },
              child: Globals.globals.userModel.imageUrl == null
                  ? CircleAvatar(
                      radius: 90,
                      child: Text(
                          Globals.globals.userModel.fullName[0].toUpperCase()),
                    )
                  : CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          NetworkImage(Globals.globals.userModel.imageUrl),
                    ),
            ),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Text(
              Globals.globals.userModel.email,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              Globals.globals.userModel.city,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              Globals.globals.userModel.phoneNumber,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
