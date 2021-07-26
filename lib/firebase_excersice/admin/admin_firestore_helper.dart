import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wac2_firebase/firebase_excersice/models/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/product_model.dart';

class AdminFirestoreHelper {
  AdminFirestoreHelper._();
  static AdminFirestoreHelper adminFirestoreHelper = AdminFirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addSlider(String imagePath, String sliderurl) async {
    await firestore
        .collection('sliders')
        .add({'sliderUrl': sliderurl, 'imagePath': imagePath});
  }

  addCategory(CategoryModel categoryModel) async {
    await firestore.collection('categories').add(categoryModel.toMap());
  }

  addProduct(ProductModel productModel) async {
    productModel.createdTime = FieldValue.serverTimestamp();
    await firestore
        .collection('categories')
        .doc(productModel.catId)
        .collection('products')
        .add(productModel.toMap());
  }

  deleteCategory(String id) async {
    await firestore.collection('categories').doc(id).delete();
  }

  deleteProduct(String catId, String id) async {
    await firestore
        .collection('categories')
        .doc(catId)
        .collection('products')
        .doc(id)
        .delete();
  }

  getOrders() async {}
  FieldValue getFirestoreTime() {
    return FieldValue.serverTimestamp();
  }
}
