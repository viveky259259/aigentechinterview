import 'dart:io';

import 'package:aigen_tech_test/ad/ad.model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;
  String dbName = "ad.db";

  String adTableName = "ad_table";

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      initiateADTable(db);
    });
  }

  initiateADTable(Database db) async {
    await db.execute("CREATE TABLE $adTableName ("
        "id integer primary key AUTOINCREMENT,"
        "user_name TEXT,"
        "description TEXT,"
        "is_favorite INTEGER,"
        "is_self INTEGER ,"
        "location TEXT,"
        "mobile TEXT,"
        "date INTEGER,"
        "brand TEXT,"
        "model TEXT,"
        "color TEXT,"
        "fuel_type INTEGER,"
        "manufacture_year INTEGER,"
        "buy_year INTEGER,"
        "seat_count INTEGER,"
        "door_count INTEGER,"
        "mileage REAL,"
        "distance_travelled REAL,"
        "images TEXT,"
        "ac INTEGER,"
        "price REAL"
        ")");
  }

  Future addADToDB(AdModel ad) async {
    final db = await database;
    var raw = await db.insert(
      adTableName,
      ad.toDBMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    print("inserted car: $raw");
    return raw;
  }

  Future<List<AdModel>> getAds() async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(adTableName);
    List<AdModel> ads = List<AdModel>();
    for (var value in result) {
      ads.add(AdModel.getAdFromMap(value));
    }
    return ads;
  }
}
