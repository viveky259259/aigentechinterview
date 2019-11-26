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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "description": description,
      "is_favorite": isFavorite,
      "is_self": isSelf,
      "location": location,
      "mobile": mobileNum,
      "date": datePosted.millisecondsSinceEpoch,
      "car_model": carModel.toMap()
    };
  }

  Map<String, dynamic> toDBMap() {
    return <String, dynamic>{
      "user_name": name,
      "description": description,
      "is_favorite": isFavorite ? 1 : 0,
      "is_self": isSelf ? 1 : 0,
      "location": location,
      "mobile": mobileNum,
      "date": datePosted == null
          ? DateTime.now().millisecondsSinceEpoch
          : datePosted.millisecondsSinceEpoch,
    }..addAll(carModel.toMap());
  }

  factory AdModel.getAdFromMap(Map<String, dynamic> map) {
    return AdModel(map["id"], map["user_name"], map["description"],
        CarModel.getCarFromMap(map), map["mobile"], map["location"],
        isFavorite:
            (map["is_favorite"] == null) ? false : map["is_favorite"] != 0,
        isSelf: (map["is_self"] == null) ? false : map["is_self"] != 0);
  }
}
