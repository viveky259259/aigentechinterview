import 'dart:io';

import 'package:aigen_tech_test/model/car.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdCreateUI extends StatefulWidget {
  @override
  _AdCreateUIState createState() => _AdCreateUIState();
}

class _AdCreateUIState extends State<AdCreateUI> {
  CarModel carModel;

  @override
  initState() {
    super.initState();
    carModel = CarModel(null, "", "", 1970, 1970, null, null, null, null,
        List(), "", null, null);
  }

  Future selectImagePicker(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add image from"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      getImage(ImageSource.camera);
                    },
                    child: Text("Camera"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      getImage(ImageSource.gallery);
                    },
                    child: Text("Gallery"),
                  ),
                ],
              ),
            ));
  }

  getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    carModel.imageUrl.add(image.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new ad"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: carModel.imageUrl.length,
                  itemBuilder: (ctx, index) {
                    return Image.file(
                      File(carModel.imageUrl[index]),
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.of(context).size.width * 0.75,
                    );
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  selectImagePicker(context);
                },
                child: Text("Add more images"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Brand Name"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Model Name"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Manufacturing Year"),
                keyboardType: TextInputType.number,
              ),
              DropdownButton(
                onChanged: (v) {},
                items: List.generate((1970 - DateTime.now().year), (index) {
                  return DropdownMenuItem(
                    child: Text((1970 + index).toString()),
                    value: 1970 + index,
                  );
                }),
                value: carModel.manufacturingYear,
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Buy Year"),
                  keyboardType: TextInputType.number),
              TextFormField(
                decoration: InputDecoration(hintText: "Color"),
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Price"),
                  keyboardType: TextInputType.number),
              TextFormField(
                decoration: InputDecoration(hintText: "Fuel"),
              ),
              DropdownButton(
                onChanged: (v) {
                  carModel.fuelType = v;
                  setState(() {});
                },
                value: carModel.fuelType,
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    value: FuelType.DIESEL,
                    child: Text("Diesel"),
                  ),
                  DropdownMenuItem(
                    value: FuelType.PETROL,
                    child: Text("Petrol"),
                  ),
                ],
              ),
              TextFormField(
                  decoration: InputDecoration(hintText: "Seat count"),
                  keyboardType: TextInputType.number),
              TextFormField(
                  decoration: InputDecoration(hintText: "Door count"),
                  keyboardType: TextInputType.number),
              TextFormField(
                decoration: InputDecoration(hintText: "Location"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Ac available"),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text(
                  "Add new ad",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
