import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Function saveFunction;
  Function validationFunction;
  String labelText;
  CustomTextField({
    @required this.saveFunction,
    @required this.validationFunction,
    @required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        validator: (v) => validationFunction(v),
        onSaved: (v) => saveFunction(v),
        decoration: InputDecoration(
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
