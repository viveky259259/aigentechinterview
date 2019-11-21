import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:aigen_tech_test/ad/ad.widget.dart';
import 'package:flutter/material.dart';

class AdUi extends StatefulWidget {
  bool isSelf;
  AdUi(this.isSelf);
  @override
  _AdUiState createState() => _AdUiState();
}

class _AdUiState extends State<AdUi> {
  List<AdModel> ads;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getAdList();
  }

  getAdList() async {
    await Future.delayed(Duration(microseconds: 100));
    ads = List();
    ads.add(AdModel(1, "car", "This is car", "image url", 12.2,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 1100,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 122,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 1222,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 400,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 300,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 123,"Boriwali (East)",isSelf:widget.isSelf));
    ads.add(AdModel(1, "car", "This is car", "image url", 987,"Boriwali (East)",isSelf:widget.isSelf));
    setState(() {
      isLoading = false;
    });
  }

sortByPrice(){
ads.sort((a,b){
  return a.price>b.price;
});
}
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : 
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.9),
          padding: EdgeInsets.all(4),
            itemCount: ads.length,
            itemBuilder: (context, index) {
              AdModel adModel = ads[index];
              return AdWidget(adModel);
            },
          );
  }
}
