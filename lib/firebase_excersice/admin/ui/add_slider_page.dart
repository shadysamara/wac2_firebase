import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac2_firebase/firebase_excersice/admin/admin_provider.dart';
import 'package:wac2_firebase/firebase_excersice/ui/widgets/custom_textfield.dart';

class AddSliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Slider'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, widget) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    provider.selectImage();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    width: double.infinity,
                    child: provider.file == null
                        ? Container(
                            color: Colors.grey,
                          )
                        : Image.file(
                            provider.file,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                CustomTextField(
                  labelText: 'Slider Url',
                  validationFunction: provider.nullValidation,
                  controller: provider.sliderUrlController,
                ),

                // DropdownButton(items: items)
                RaisedButton(
                    child: Text('Add Slider'),
                    onPressed: () {
                      provider.addSlider();
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
