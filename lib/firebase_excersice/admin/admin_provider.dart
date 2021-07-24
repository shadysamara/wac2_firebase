import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_firestore_helper.dart';
import 'package:wac2_firebase/firebase_excersice/admin/category_model.dart';
import 'package:wac2_firebase/firebase_excersice/admin/product_model.dart';
import 'package:wac2_firebase/firebase_excersice/admin/ui/add_category_page.dart';
import 'package:wac2_firebase/firebase_excersice/helpers/firestorage_helper.dart';
import 'package:wac2_firebase/firebase_excersice/providers/auth_provider.dart';

class AdminProvider extends ChangeNotifier {
  File file;
  List<CategoryModel> categories;
  List<ProductModel> products;
  CategoryModel selectedCategoryModel;

  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  GlobalKey<FormState> productKey = GlobalKey<FormState>();
  GlobalKey<FormState> categoryKey = GlobalKey<FormState>();

  selectImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    this.file = File(pickedFile.path);
    notifyListeners();
  }

  nullValidation(String value) {
    if (value.length == 0) {
      return 'Required field';
    }
  }

  addProduct() async {
    if (productKey.currentState.validate()) {
      String imageUrl = await uploadImage('products');
      ProductModel productModel = ProductModel(
        productName: productNameController.text,
        productDescription: productDescController.text,
        price: double.parse(productPriceController.text),
        imageUrl: imageUrl,
        catId: selectedCategoryModel.id,
      );
      await AdminFirestoreHelper.adminFirestoreHelper.addProduct(productModel);
    } else {
      return;
    }
  }

  selectCategory(CategoryModel categoryModel) {
    this.selectedCategoryModel = categoryModel;
    notifyListeners();
  }

  addCategory(context) async {
    if (categoryKey.currentState.validate()) {
      String imageUrl = await uploadImage('categories');
      CategoryModel categoryModel =
          CategoryModel(name: categoryNameController.text, imageurl: imageUrl);
      await AdminFirestoreHelper.adminFirestoreHelper
          .addCategory(categoryModel);
      clearVariables();
    } else {
      return;
    }
  }

  clearVariables() {
    categoryNameController.clear();
    productNameController.clear();
    productDescController.clear();
    productPriceController.clear();
    this.file = null;
    notifyListeners();
  }

  getCategoryProducts(String id) async {
    List<ProductModel> products =
        await AdminFirestoreHelper.adminFirestoreHelper.getAllProducts(id);
    this.products = products;
    notifyListeners();
  }

  getCategories() async {
    List<CategoryModel> categories =
        await AdminFirestoreHelper.adminFirestoreHelper.getAllCategories();
    this.categories = categories;
    notifyListeners();
  }

  Future<String> uploadImage(String path) async {
    String imageUrl =
        await FirestorageHelper.firestorageHelper.uploadImage(file, path);
    return imageUrl;
  }
}
