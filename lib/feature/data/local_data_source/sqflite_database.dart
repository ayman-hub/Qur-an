import 'dart:async';
import 'dart:io';

import 'package:moshaf/feature/data/model/read_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  DBHelper.internal();

  factory DBHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'db.sqlite');
    var dB = openDatabase(path, version: 2, onCreate: _onCreate);
    return dB;
  }

  Future<void> _onCreate(Database db, int version) async {
 /*   print('create database');
    await db.execute('''
     CREATE TABLE "$MOSHAF_TABLE" (
	"$PAGE_NUM"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"$SORAH"	TEXT DEFAULT NULL ,
	"$PAGES"	blob NOT NULL
      );
    ''');*/
  }

  Future<bool> insertPage(ReadModel readModel) async {
   /* var dbClient = await db;
    int result = await dbClient.insert(MOSHAF_TABLE, await readModel);
    print('data inserted ${result == 1}');
    return result==1 ;*/
   return false;
  }

  Future<List<ReadModel>> get getAllPages async {
   /* print('get data from database');
    var dbClient = await db;
    List<ReadModel> data = List<ReadModel>();
    await dbClient
        .query(MOSHAF_TABLE)
        .then((List<Map<String, dynamic>> list) {
          print("get list $list");
      list.forEach((Map<String, dynamic> map) {
        print(map[SORAH]);
        data.add(ReadModel.map(map));
        print(map['id']);
      });
    });
    return data;*/
   return null;
  }

 /* Future<int> insertSorah(
      {@required DataBodyModel dataBodyModel, @required String name}) async {
    var dbClient = await db;
    int result =
        await dbClient.insert(DATABASE_BODY, dataBodyModel.toMap(name));
    print('data inserted ${result == 1}');
    return result;
  }
  Stream<List<DataModel>> get watchAllName async* {
    var dbClient = await db;
    List<DataModel> data = List<DataModel>();
    await dbClient
        .query(FIREBASE_COLLECITON)
        .then((List<Map<String, dynamic>> list) {
      list.forEach((Map<String, dynamic> map) {
        data.add(DataModel(
            name: map[FIREBASE_NAME], imageurl: map[FIREBASE_IMAGE_URL]));
        print(map['id']);
      });
    });
    yield data;
  }

  Future<List<DataBodyModel>> getAllSorah(String name) async {
    var dbClient = await db;
    List<DataBodyModel> data = List<DataBodyModel>();
    await dbClient
        .rawQuery('SELECT * FROM $DATABASE_BODY WHERE name=?', [name]).then(
            (List<Map<String, dynamic>> list) {
      list.forEach((Map<String, dynamic> map) {
        data.add(
            DataBodyModel(sorah: map[FIREBASE_SORAH], url: map[FIREBASE_URL]));
        print("the data id in sqflite  ${map['id']}");
      });
    });
    print("data from sqflite  $data");
    return data;
  }*/
}
