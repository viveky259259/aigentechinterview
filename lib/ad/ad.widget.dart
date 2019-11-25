import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdWidget extends StatelessWidget {
  final AdModel _adModel;
  final Function(AdModel adModel) onItemClick;
  AdWidget(this._adModel, this.onItemClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick(_adModel);
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
                  Image.asset(
                    _adModel.carModel.imageUrl[0],
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
                        "${_adModel.carModel.price}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        "${_adModel.carModel.fuelType == FuelType.DIESEL ? "Diesel" : "Petrol"}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(_adModel.name,
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text(_adModel.location,
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )),
    );
  }
}
