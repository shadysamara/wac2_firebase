import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_category_page.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_product_page.dart';
import 'package:wac2_firebase/firebase_excersice/utilities/routers.dart';

class AdminMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
              child: Text('ADD PRODUCT'),
              onPressed: () {
                AppRouter.router.pushToNewWidget(AddProductPage());
              }),
          RaisedButton(
              child: Text('ADD CATEGORY'),
              onPressed: () {
                AppRouter.router.pushToNewWidget(AddCategoryPage());
              }),
        ],
      ),
    );
  }
}
