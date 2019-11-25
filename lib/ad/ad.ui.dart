import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/ad/ad.widget.dart';
import 'package:aigen_tech_test/interfaces/i.adui.helper.dart';
import 'package:aigen_tech_test/model/car.model.dart';
import 'package:aigen_tech_test/model/fueltype.dart';
import 'package:flutter/material.dart';

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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
        isSelf: widget.isSelf));
    ads.add(AdModel(
        1,
        "car",
        "97 Checkpoints have been inspected on all  Assured Cars. This 2012 Audi A4 3.0 TDI Quattro Technology is in excellent condition. This Diesel car has been driven around 55762 KMs. The car been previously owned by Two individuals We offer Hassle-free Paper Transfer & RTO Services on every  Assured car. We can also offer great EMI options to keep the car pocket-friendly. Contact us to know more.",
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
            "black",
            4,
            false),
        "80808080",
        "Boriwali (East)",
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
                        crossAxisCount: 2, childAspectRatio: 0.85),
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
