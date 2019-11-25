import 'package:aigen_tech_test/model/car.model.dart';

class AdModel {
  int id;
  String name;
  String description;
  bool isFavorite;
  bool isSelf;
  String location;
  CarModel carModel;
  String mobileNum;

  AdModel(this.id,this.name,this.description,this.carModel,this.location,this.mobileNum,{this.isFavorite=false,this.isSelf=false});

}
