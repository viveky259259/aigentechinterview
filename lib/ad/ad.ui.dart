import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/ad/ad.widget.dart';
import 'package:aigen_tech_test/model/car.model.dart';
import 'package:aigen_tech_test/interfaces/i.adui.helper.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ad.details.ui.dart';

class AdUi extends StatefulWidget implements IAdUiHelper {
  bool isSelf;

  AdUi(this.isSelf);

  _AdUiState state;

  @override
  _AdUiState createState() {
    state = _AdUiState();
    return state;
  }

  @override
  void sortByPrice() {}
}

class _AdUiState extends State<AdUi> {
  List<AdModel> ads;
  bool isLoading = true;
  bool isFiltered = false;

  @override
  void initState() {
    super.initState();
    getAdList();
  }

  getAdList() async {
    await Future.delayed(Duration(microseconds: 100));
    ads = List();
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.PETROL,
            120000,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.DIESEL,
            120000,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.PETROL,
            134000,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.DIESEL,
            121212,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.PETROL,
            1212,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.DIESEL,
            12122121,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "This is car",
        CarModel(
            4,
            "maruti",
            "8100D",
            2010,
            2011,
            1200,
            24.2,
            FuelType.DIESEL,
            10000,
            ["assets/images/car1.jpg", "assets/images/car1.jpg"],
            "black"),
        "Boriwali (East)",
        "80808080",
        isSelf: widget.isSelf));
    setState(() {
      isLoading = false;
    });
  }

  sortByPrice() {
    ads.sort((a, b) {
      return a.carModel.price.compareTo(b.carModel.price);
    });
    setState(() {});
  }

  filterByDiesel() {
    if (isFiltered) {
      isFiltered = false;
      ads.clear();
      ads = getAdList();
      return;
    }
    ads.removeWhere((each) => each.carModel.fuelType != FuelType.DIESEL);

    isFiltered = true;
    setState(() {});
  }

  onItemClick(AdModel adModel) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AdDetailsUi(adModel)));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.grey.shade200,
                      onPressed: filterByDiesel,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          isFiltered
                              ? Icon(Icons.invert_colors_off)
                              : Icon(Icons.invert_colors),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Filter by Diesel"),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.grey.shade200,
                      onPressed: sortByPrice,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.sort),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Sort By Price"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  removeBottom: true,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.9),
                    padding: EdgeInsets.all(4),
                    itemCount: ads.length,
                    itemBuilder: (context, index) {
                      AdModel adModel = ads[index];
                      return AdWidget(adModel, onItemClick);
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
