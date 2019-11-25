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
  DateTime datePosted;

  AdModel(this.id, this.name, this.description, this.carModel, this.mobileNum,
      this.location,
      {this.isFavorite = false, this.isSelf = false});
}
