import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdDetailsUi extends StatefulWidget {
  final AdModel _adModel;

  AdDetailsUi(this._adModel);

  @override
  _AdDetailsUiState createState() => _AdDetailsUiState();
}

class _AdDetailsUiState extends State<AdDetailsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 32,),
          CarouselSlider(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            items: widget._adModel.carModel.imageUrl.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(i));
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("About Car"),
                Row(
                  children: <Widget>[
                    Text("Brand: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.brand}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Model: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.model}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Fuel: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.fuelType==FuelType.DIESEL?"Diesel":"Petrol"}" ,
                      style: TextStyle(fontSize: 16),
                    ),

                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Price: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.price}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Color: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.color.toUpperCase()}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Buy Year: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.buyYear}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Manufacturing Year: "),
                    SizedBox(width: 8,),
                    Text(
                      "${widget._adModel.carModel.manufacturingYear}" ,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
