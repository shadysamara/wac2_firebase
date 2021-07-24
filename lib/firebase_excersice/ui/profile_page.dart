import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_main_page.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/globals.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

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
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          )
        ],
        title: Text(Globals.globals.userModel.fullName),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, widget) {
        return provider.userModel == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                          visible: provider.userModel.isAdmin,
                          child: IconButton(
                            icon: Icon(Icons.settings),
                            onPressed: () {
                              print('hello');
                              AppRouter.router.pushToNewWidget(AdminMainPage());
                            },
                          )),
                    ),
                    GestureDetector(
                      onTap: () async {
                        PickedFile pickedFile = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        await provider.updateUserImage(File(pickedFile.path));
                      },
                      child: provider.userModel.imageUrl == null
                          ? CircleAvatar(
                              radius: 70,
                              child: Text(
                                  provider.userModel.fullName[0].toUpperCase()),
                            )
                          : CircleAvatar(
                              radius: 90,
                              backgroundImage:
                                  NetworkImage(provider.userModel.imageUrl),
                            ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Email: ' + provider.userModel.email,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'City: ' + provider.userModel.city,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'PhoneNumber: ' + provider.userModel.phoneNumber,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
