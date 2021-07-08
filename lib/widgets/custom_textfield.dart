import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  Function saveFunction;
  Function validateFunction;
  CustomTextField(this.label, this.saveFunction, this.validateFunction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onSaved: (v) => saveFunction(v),
        validator: (v) => validateFunction(v),
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
