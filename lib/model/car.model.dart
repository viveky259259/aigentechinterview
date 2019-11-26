import 'package:aigen_tech_test/delegate/list.delegate.dart';
import 'package:aigen_tech_test/model/fueltype.dart';

class CarModel {
  int seatCount;
  String brand;
  String model;
  int manufacturingYear;
  int buyYear;
  double distanceTravelled;
  double mileage;
  FuelType fuelType;
  double price;
  List<String> images;
  String color;
  int doorCount;
  bool isAcAvailable;

  CarModel(
      this.seatCount,
      this.brand,
      this.model,
      this.manufacturingYear,
      this.buyYear,
      this.distanceTravelled,
      this.mileage,
      this.fuelType,
      this.price,
      this.images,
      this.color,
      this.doorCount,
      this.isAcAvailable);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "brand": brand,
      "model": model,
      "color": color,
      "fuel_type": (fuelType == FuelType.DIESEL) ? 0 : 1,
      "manufacture_year": manufacturingYear,
      "buy_year": buyYear,
      "seat_count": seatCount,
      "door_count": doorCount,
      "mileage": mileage,
      "distance_travelled": distanceTravelled,
      "images": ListDelegate.getStringFromList(images),
      "ac": isAcAvailable ? 1 : 0,
      "price": price
    };
  }

  factory CarModel.getCarFromMap(Map<String, dynamic> map) {
    return CarModel(
        map["seat_count"],
        map["brand"],
        map["model"],
        map["manufacture_year"],
        map["buy_year"],
        map["distance_travelled"],
        map["mileage"],
        map["fuel_type"] == 0 ? FuelType.DIESEL : FuelType.PETROL,
        map["price"],
        ListDelegate.getListFromCSV(map["images"]),
        map["color"],
        map["door_count"],
        map["ac"] == 0 ? false : true);
  }
}
