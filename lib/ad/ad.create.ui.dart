import 'dart:io';

import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/database/db.provider.dart';
import 'package:aigen_tech_test/model/car.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as prefix0;
import 'package:path_provider/path_provider.dart';

class AdCreateUI extends StatefulWidget {
  @override
  _AdCreateUIState createState() => _AdCreateUIState();
}

class _AdCreateUIState extends State<AdCreateUI> {
  CarModel carModel;
  TextEditingController _brandNameController;
  TextEditingController _modelNameController;
  TextEditingController _colorNameController;
  TextEditingController _priceController;
  TextEditingController _locationController;
  TextEditingController _descriptionController;
  TextEditingController _distanceTravelledController;
  TextEditingController _mileageController;

  FocusNode _brandNameFocusNode;
  FocusNode _modelNameFocusNode;
  FocusNode _colorNameFocusNode;
  FocusNode _priceFocusNode;
  FocusNode _locationFocusNode;
  FocusNode _descriptionFocusNode;
  FocusNode _distanceTravelledFocusNode;
  FocusNode _mileageFocusNode;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    carModel = CarModel(null, "", "", null, null, null, null, null, null,
        List(), "", null, false);
    _brandNameController = TextEditingController();
    _modelNameController = TextEditingController();
    _colorNameController = TextEditingController();
    _priceController = TextEditingController();
    _locationController = TextEditingController();
    _descriptionController = TextEditingController();
    _distanceTravelledController = TextEditingController();
    _mileageController = TextEditingController();

    _brandNameFocusNode = FocusNode();
    _modelNameFocusNode = FocusNode();
    _colorNameFocusNode = FocusNode();
    _priceFocusNode = FocusNode();
    _locationFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _distanceTravelledFocusNode = FocusNode();
    _mileageFocusNode = FocusNode();
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
    saveImageInLocalFolder(image);
  }

  bool hasValidInput(String value, String input, FocusNode focusNode) {
    if (value == null || value.trim() == "") {
      showSnackBar("Enter $input name");
      FocusScope.of(context).requestFocus(focusNode);
      return false;
    }
    return true;
  }

  bool hasValidValues(value, String input) {
    if (value == null) {
      showSnackBar("Select $input");
      return false;
    }
    return true;
  }

  saveAd() async {
    String brand = _brandNameController.text;
    String model = _modelNameController.text;
    String color = _colorNameController.text;
    String price = _priceController.text;
    String location = _locationController.text;
    String description = _descriptionController.text;
    String distanceTravelled = _distanceTravelledController.text;
    String mileage = _mileageController.text;

    if (hasValidInput(brand, "brand", _brandNameFocusNode) &&
        hasValidInput(
            model,
            ""
            "model",
            _modelNameFocusNode) &&
        hasValidInput(color, "color", _colorNameFocusNode) &&
        hasValidInput(price, "price", _priceFocusNode) &&
        hasValidInput(distanceTravelled, "distance travelled",
            _distanceTravelledFocusNode) &&
        hasValidInput(mileage, "mileage", _mileageFocusNode) &&
        hasValidInput(location, "location", _locationFocusNode) &&
        hasValidInput(description, "description", _descriptionFocusNode) &&
        hasValidValues(carModel.manufacturingYear, "manufacture year") &&
        hasValidValues(carModel.buyYear, "buy year") &&
        hasValidValues(carModel.fuelType, "fuel type") &&
        hasValidValues(carModel.seatCount, "seat count") &&
        hasValidValues(carModel.doorCount, "door count")) {
      carModel.model = model;
      carModel.brand = brand;
      carModel.color = color;
      carModel.price = double.parse(price);
      carModel.distanceTravelled = double.parse(distanceTravelled);
      carModel.mileage = double.parse(mileage);
      AdModel _adModel = AdModel(
          -1, "Aigen Tech", description, carModel, "8097357765", location,
          isSelf: true)
        ..datePosted = DateTime.now();

      print(_adModel.toDBMap());
      isLoading = true;
      setState(() {});
      await DatabaseProvider.db.addADToDB(_adModel);
      isLoading = false;
      setState(() {});
      showSnackBar("Car ad added successfully", isError: false);
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pop(true);
    }
  }

  saveImageInLocalFolder(File oldFile) async {
    //save images in local folder
    final String path = (await getExternalStorageDirectory()).path;

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
          prefix0.basename(oldFile.path);

      File newFile = File("$path/$fileName");
      newFile.writeAsBytesSync(oldFile.readAsBytesSync());
      print(newFile.existsSync());
      carModel.images.add(newFile.path);
    } catch (e) {
      print(e);
    }

    setState(() {});
  }

  showSnackBar(String msg, {isError = true}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: isError ? Colors.red : Colors.green,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Create new ad"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: carModel.images.length == 0
                          ? Center(
                              child: Text("Selected "
                                  "image"
                                  "s "
                                  "will "
                                  "be "
                                  "displ"
                                  "ayed "
                                  "here"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: carModel.images.length,
                              itemBuilder: (ctx, index) {
                                return Image.file(
                                  File(carModel.images[index]),
                                  fit: BoxFit.fitHeight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                );
                              },
                            ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        selectImagePicker(context);
                      },
                      child: Text(carModel.images.length == 0
                          ? "Add images"
                          : "Add more "
                              "images"),
                    ),
                    TextFormField(
                      controller: _brandNameController,
                      focusNode: _brandNameFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Brand Name", labelText: "Brand Name"),
                      onFieldSubmitted: (v) {
                        FocusScope.of(context)
                            .requestFocus(_modelNameFocusNode);
                      },
                    ),
                    TextFormField(
                      controller: _modelNameController,
                      textInputAction: TextInputAction.next,
                      focusNode: _modelNameFocusNode,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      decoration: InputDecoration(
                          hintText: "Model Name", labelText: "Model Name"),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text("Manufacturing Year")),
                        Expanded(
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Select Year"),
                            onChanged: (v) {
                              carModel.manufacturingYear = v;
                              setState(() {});
                            },
                            items: List.generate((DateTime.now().year - 1970),
                                (index) {
                              return DropdownMenuItem(
                                child: Text((1970 + index).toString()),
                                value: 1970 + index,
                              );
                            }),
                            value: carModel.manufacturingYear,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text("Buy Year")),
                        Expanded(
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Select Year"),
                            onChanged: (v) {
                              carModel.buyYear = v;
                              setState(() {});
                            },
                            items: List.generate((DateTime.now().year - 1970),
                                (index) {
                              return DropdownMenuItem(
                                child: Text((1970 + index).toString()),
                                value: 1970 + index,
                              );
                            }),
                            value: carModel.buyYear,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _colorNameController,
                      textInputAction: TextInputAction.next,
                      focusNode: _colorNameFocusNode,
                      decoration: InputDecoration(
                          hintText: "Color",
                          labelText: "Col"
                              "or"),
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                    ),
                    TextFormField(
                        controller: _priceController,
                        focusNode: _priceFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        decoration: InputDecoration(
                            hintText: "Price",
                            labelText: "P"
                                "rice"),
                        keyboardType: TextInputType.number),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text("Fuel Type")),
                        Expanded(
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Fuel type"),
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
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text("Seat count")),
                        Expanded(
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Seat count"),
                            onChanged: (v) {
                              carModel.seatCount = v;
                              setState(() {});
                            },
                            items: List.generate(10, (index) {
                              return DropdownMenuItem(
                                child: Text((1 + index).toString()),
                                value: 1 + index,
                              );
                            }),
                            value: carModel.seatCount,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Text("Door count")),
                        Expanded(
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Door count"),
                            onChanged: (v) {
                              carModel.doorCount = v;
                              setState(() {});
                            },
                            items: List.generate(6, (index) {
                              return DropdownMenuItem(
                                child: Text((1 + index).toString()),
                                value: 1 + index,
                              );
                            }),
                            value: carModel.doorCount,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Ac available: "),
                        Switch(
                          value: carModel.isAcAvailable,
                          onChanged: (v) {
                            carModel.isAcAvailable = v;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _distanceTravelledController,
                      focusNode: _distanceTravelledFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(_mileageFocusNode);
                      },
                      decoration: InputDecoration(
                          hintText: "Distance travelled",
                          labelText: ""
                              "Distance travelled"),
                    ),
                    TextFormField(
                      controller: _mileageController,
                      keyboardType: TextInputType.number,
                      focusNode: _mileageFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(_locationFocusNode);
                      },
                      decoration: InputDecoration(
                          hintText: "Mileage",
                          labelText: ""
                              "Mileage"),
                    ),
                    TextFormField(
                      controller: _locationController,
                      focusNode: _locationFocusNode,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      decoration: InputDecoration(
                          hintText: "Location",
                          labelText: ""
                              "Location"),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      focusNode: _descriptionFocusNode,
                      textInputAction: TextInputAction.done,
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: "Description",
                          labelText: ""
                              "Description"),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        color: Colors.blue,
                        onPressed: saveAd,
                        child: Text(
                          "Add new ad",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
