import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:flutter/material.dart';

class AdWidget extends StatelessWidget {
  final AdModel _adModel;
  AdWidget(this._adModel);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "assets/images/car1.jpg",
                  height: 124,
                ),
                Text(
                  _adModel.price.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(_adModel.name,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                    SizedBox(height: 16,),
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
              child: IconButton(icon: Icon(Icons.favorite,color: Colors.white,),onPressed: (){

              },),
            )
          ],
        ));
  }
}
