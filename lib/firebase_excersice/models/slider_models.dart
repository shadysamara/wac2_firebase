import 'dart:convert';

import 'package:flutter/material.dart';

class SliderModel {
  String imagePath;
  String imageUrl;
  SliderModel({
    @required this.imagePath,
    @required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'sliderUrl': imageUrl,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      imagePath: map['imagePath'],
      imageUrl: map['sliderUrl'],
    );
  }
}
