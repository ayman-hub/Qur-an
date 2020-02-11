import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPreference {
  SharedPreferences sharedPreferences;
  GetSharedPreference({@required this.sharedPreferences});

  Future<void> setSharedPreferences(PageType type,int pageNum) async {
    print('sharedReferencePageType = ${sharedReferencePageType[type]}');
    sharedPreferences.setInt(sharedReferencePageType[type], pageNum);
  }

  int getSharedPreferences(PageType type) {
    return sharedPreferences?.getInt(sharedReferencePageType[type]) ?? 0;
  }
}
