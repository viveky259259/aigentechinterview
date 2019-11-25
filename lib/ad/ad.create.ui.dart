import 'dart:io';

import 'package:aigen_tech_test/model/car.model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

class AdCreateUI extends StatefulWidget {
  @override
  _AdCreateUIState createState() => _AdCreateUIState();
}

class _AdCreateUIState extends State<AdCreateUI> {
  CarModel carModel;

  @override
  initState() {
    super.initState();
    carModel =
        CarModel(-1, "", "", -1, -1, -1, -1, null, -1, List(), "", -1, null);
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    carModel.imageUrl.add(image.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new ad"),
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: carModel.imageUrl.length,
            itemBuilder: (context, index) {
              return Image.file(File(carModel.imageUrl[index]));
            },
          ),
          RaisedButton(
            onPressed: () {
              getImage();
            },
            child: Text("Add image"),
          )
        ],
      ),
    );
  }
}
