import 'dart:convert';

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String imageurl;
  String id;
  CategoryModel({
    @required this.name,
    @required this.imageurl,
    @required this.id,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'imageurl': imageurl};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      imageurl: map['imageurl'],
      id: map['id'],
    );
  }
}
