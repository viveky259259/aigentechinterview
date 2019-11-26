import 'dart:io';

import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdWidget extends StatefulWidget {
  final AdModel _adModel;
  final Function(AdModel adModel) onItemClick;
  AdWidget(this._adModel, this.onItemClick);

  @override
  _AdWidgetState createState() => _AdWidgetState();
}

class _AdWidgetState extends State<AdWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemClick(widget._adModel);
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget._adModel.isSelf
                      ? Image.file(
                          File(widget._adModel.carModel.images[0]
                              .replaceFirst(
                                  "emulated/0",
                                  "s"
                                      "elf/primary")
                              .trim()
                              .toString()),
                          height: 124,
                        )
                      : Image.asset(
                          widget._adModel.carModel.images[0],
                          height: 124,
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        size: 16,
                        color: Colors.grey,
                      ),
                      Text(
                        "${widget._adModel.carModel.price}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "${widget._adModel.carModel.fuelType == FuelType.DIESEL ? "Diesel" : "Petrol"}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(widget._adModel.name,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text(widget._adModel.location,
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                ],
              ),
              widget._adModel.isSelf
                  ? SizedBox()
                  : Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          widget._adModel.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          widget._adModel.isFavorite =
                              !widget._adModel.isFavorite;
                          setState(() {});
                        },
                      ),
                    )
            ],
          )),
    );
  }
}
