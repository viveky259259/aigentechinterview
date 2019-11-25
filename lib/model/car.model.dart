import 'package:aigen_tech_test/model/fueltype.dart';

class CarModel {
  int seatCount;
  String brand;
  String model;
  int manufacturingYear;
  int buyYear;
  double distanceTravelled;
  double milege;
  FuelType fuelType;
  double price;
  List<String> imageUrl;
  String color;
  int numberOfDoors;
  bool isAcAvailable;

  CarModel(
      this.seatCount,
      this.brand,
      this.model,
      this.manufacturingYear,
      this.buyYear,
      this.distanceTravelled,
      this.milege,
      this.fuelType,
      this.price,
      this.imageUrl,
      this.color,
      this.numberOfDoors,
      this.isAcAvailable);
}
