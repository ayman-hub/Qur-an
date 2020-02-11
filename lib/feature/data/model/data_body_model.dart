import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:flutter/material.dart';

class DataBodyModel extends BodyEntities {
   String name;
   String url;

  DataBodyModel({@required this.name, @required this.url})
      : super(name: name, url: url);

  DataBodyModel.map(Map<String, dynamic> map) {
    this.name = map[FIREBASE_SORAH];
    this.url = map[FIREBASE_URL];
  }

  Map<String, dynamic> toMap(String name) {
    Map<String, dynamic> map = Map<String, dynamic>();
    map[FIREBASE_SORAH] = this.name;
    map[FIREBASE_URL] = this.url;
    map[FIREBASE_NAME] = name;
    return map;
  }
}
