import 'dart:async';

import 'package:moshaf/feature/data/local_data_source/shared_preferences.dart';
import 'package:moshaf/feature/data/local_data_source/sqflite_database.dart';
import 'package:moshaf/feature/data/model/read_model.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class LocalDataSource {
  Future<List<ReadModel>> getAllPage();

  Future<bool> insertPage(ReadModel readModel);

  int getSavedPageNum(PageType type);

  void setPageNum(PageType type,int pageNum);
}

class LocalDataSourceImp extends LocalDataSource {
  // AppDatabase database;
  DBHelper dbHelper;
  GetSharedPreference sharedPreference;

  LocalDataSourceImp(
      {@required this.dbHelper, @required this.sharedPreference});

/*  @override
  Stream<List<DataModel>> watchAllName()  {
    return  dbHelper.watchAllName;
  }
  @override
  Future<List<DataModel>> getAllName()async  {
    return await dbHelper.getAllName;
  }

  @override
  Future<List<DataBodyModel>> getAllSorah(String name) async {
    return await dbHelper.getAllSorah(name);
  }

  @override
  setAllName(DataModel data) async {
    await dbHelper.insertName(data);
  }

  @override
  setAllSorah(String name, DataBodyModel data) async {
    await dbHelper.insertSorah(dataBodyModel: data, name: name);
  }*/

  @override
  Future<List<ReadModel>> getAllPage() {
    print('get localDataSource');
    return dbHelper.getAllPages;
  }

  @override
  Future<bool> insertPage(ReadModel readModel) {
    return dbHelper.insertPage(readModel);
  }

  @override
  int getSavedPageNum(PageType type) {
    return sharedPreference.getSharedPreferences(type);
  }

  @override
  void setPageNum(PageType type,int pageNum) {
    sharedPreference.setSharedPreferences(type,pageNum);
  }
}
