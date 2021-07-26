import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wac2_firebase/firebase_excersice/models/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/product_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/slider_models.dart';

class CustomerFirebaseHelper {
  CustomerFirebaseHelper._();
  static CustomerFirebaseHelper customerFirebaseHelper =
      CustomerFirebaseHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<SliderModel>> getAllSliders() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('sliders').get();
    List<SliderModel> sliders = querySnapshot.docs.map((e) {
      Map map = e.data();

      return SliderModel.fromMap(map);
    }).toList();
    return sliders;
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
        querySnapshot.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
  }

  getProductDetails() async {}
  addToCart(ProductModel productModel) async {
    await firestore.collection('cart').add(productModel.toMap());
  }

  Future<List<ProductModel>> getCart() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('cart').get();
    List<ProductModel> products =
        querySnapshot.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    return products;
  }
}
