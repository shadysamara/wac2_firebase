import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_category_page.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_product_page.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_slider_page.dart';
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            child: RaisedButton(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('ADD PRODUCT'),
                onPressed: () {
                  AppRouter.router.pushToNewWidget(AddProductPage());
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            child: RaisedButton(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('ADD CATEGORY'),
                onPressed: () {
                  AppRouter.router.pushToNewWidget(AddCategoryPage());
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            child: RaisedButton(
                color: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('ADD SLIDER'),
                onPressed: () {
                  AppRouter.router.pushToNewWidget(AddSliderPage());
                }),
          ),
        ],
      ),
    );
  }
}
