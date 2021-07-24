import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_provider.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';

class AddCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, widget) {
        return Container(
          child: Form(
            key: provider.categoryKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.selectImage();
                    },
                    child: CircleAvatar(
                      radius: 70,
                      child: provider.file == null
                          ? Container(
                              color: Colors.grey,
                            )
                          : Image.file(provider.file),
                    ),
                  ),
                  CustomTextField(
                    labelText: 'Category Name',
                    validationFunction: provider.nullValidation,
                    controller: provider.categoryNameController,
                  ),

                  // DropdownButton(items: items)
                  RaisedButton(
                      child: Text('Add Product'),
                      onPressed: () {
                        provider.addCategory(context);
                      })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
