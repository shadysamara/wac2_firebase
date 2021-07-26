import 'package:flutter/material.dart';
import 'package:wac2_firebase/firebase_excersice/customer/customer_firebase_helper.dart';
import 'package:wac2_firebase/firebase_excersice/models/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/product_model.dart';
import 'package:wac2_firebase/firebase_excersice/models/slider_models.dart';

class CustomerProvider extends ChangeNotifier {
  List<CategoryModel> categories;
  List<ProductModel> products;
  List<ProductModel> cartProducts;
  List<SliderModel> sliders;

  getCategoryProducts(String id) async {
    List<ProductModel> products =
        await CustomerFirebaseHelper.customerFirebaseHelper.getAllProducts(id);
    this.products = products;
    notifyListeners();
  }

  getCategories() async {
    List<CategoryModel> categories =
        await CustomerFirebaseHelper.customerFirebaseHelper.getAllCategories();
    this.categories = categories;
    getCategoryProducts(categories.first.id);
    notifyListeners();
  }

  getSliders() async {
    List<SliderModel> categories =
        await CustomerFirebaseHelper.customerFirebaseHelper.getAllSliders();
    this.sliders = categories;
    notifyListeners();
  }

  Future<ProductModel> getCart() async {
    cartProducts =
        await CustomerFirebaseHelper.customerFirebaseHelper.getCart();
    notifyListeners();
  }

  addToCart(ProductModel productModel) async {
    await CustomerFirebaseHelper.customerFirebaseHelper.addToCart(productModel);
    getCart();
  }
}
