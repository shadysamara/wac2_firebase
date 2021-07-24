import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wac2_firebase/firebase_excersice/admin/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/admin/product_model.dart';

class AdminFirestoreHelper {
  AdminFirestoreHelper._();
  static AdminFirestoreHelper adminFirestoreHelper = AdminFirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  Future<List<CategoryModel>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('categories').get();
    List<CategoryModel> categories = querySnapshot.docs.map((e) {
      Map map = e.data();
      map['id'] = e.id;
      return CategoryModel.fromMap(map);
    }).toList();
    return categories;
  }

  Future<List<ProductModel>> getAllProducts(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('categories')
        .doc(catId)
        .collection('products')
        .get();
    List<ProductModel> products =
        querySnapshot.docs.map((e) => ProductModel.fromMap(e.data()));
    return products;
  }

  getOrders() async {}
  FieldValue getFirestoreTime() {
    return FieldValue.serverTimestamp();
  }
}
