import 'dart:io';

import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdDetailsUi extends StatefulWidget {
  final AdModel _adModel;

  AdDetailsUi(this._adModel);

  @override
  _AdDetailsUiState createState() => _AdDetailsUiState();
}

class _AdDetailsUiState extends State<AdDetailsUi> {
  TextEditingController _nameController;
  TextEditingController _messageController;

  @override
  initState() {
    super.initState();
    _nameController = TextEditingController();
    _messageController = TextEditingController();
  }

  sendMessage(String name, String message) {
    launch("mailto:info@aigen.tech?subject=Contact for car from $name"
        "&body=$message");
  }

  callSeller() {
    launch("tel://${widget._adModel.mobileNum}");
  }

  String validateInput(String text) {
    if (text.length == 0 || text.trim().length == 0) {
      return "Enter correct value";
    }
    return null;
  }

  contactSeller(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Contact seller"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        errorText: validateInput(
                          _nameController.text,
                        )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Message"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: () {
                      String name = _nameController.text;
                      String message = _messageController.text;
                      if (validateInput(name) == null &&
                          validateInput(message) == null)
                        sendMessage(name, message);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Send Message",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(),
                  SizedBox(
                    height: 8,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    onPressed: () {
                      callSeller();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            CarouselSlider(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              items: widget._adModel.carModel.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(

                        ///storage/self/primary/Android/data/com.example.aigen_tech_test/files/1574776433108Screenshot_20191106-144447.png
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: widget._adModel.isSelf
                            ? Image.file(File((i
                                .replaceFirst(
                                    "emulated/0",
                                    "s"
                                        "elf/primary")
                                .trim()
                                .toString())))
                            : Image.asset(i));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "About Car",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 4),
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Brand: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.brand.toUpperCase()}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Model: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.model}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Fuel: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.fuelType == FuelType.DIESEL ? "Diesel" : "Petrol"}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Price: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        size: 14,
                      ),
                      Text(
                        "${widget._adModel.carModel.price}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Color: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.color.toUpperCase()}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Buy Year: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.buyYear}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Manufacturing Year: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.manufacturingYear}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Seat count: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.seatCount}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Door count: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.carModel.doorCount}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Location: ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${widget._adModel.location}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Ac available: ",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    widget._adModel.carModel.isAcAvailable
                        ? Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : Icon(Icons.close, color: Colors.red)
                  ])
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(8),
                    onPressed: () {
                      contactSeller(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.call, color: Colors.white),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Contact Seller",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(8),
                    color:
                        widget._adModel.isFavorite ? Colors.grey : Colors.blue,
                    onPressed: () {
                      widget._adModel.isFavorite = !widget._adModel.isFavorite;
                      setState(() {});
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                            widget._adModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget._adModel.isFavorite
                              ? "Remove favorite"
                              : "Add "
                                  "favorite",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                widget._adModel.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, wordSpacing: 1.4),
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                children: <Widget>[
                  Text(
                    "Listed On:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "27-11-2019",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "Ad id:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget._adModel.id.toString(),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
