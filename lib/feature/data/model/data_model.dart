import 'package:equatable/equatable.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:flutter/material.dart';

class DataModel extends NameEntities {
  String name;
  String imageurl;

  DataModel({@required this.name, @required this.imageurl})
      : super(name: name, imageurl: imageurl);

  DataModel.Map(Map<String, dynamic> map) {
    this.name = map[FIREBASE_NAME];
    this.imageurl = map[FIREBASE_IMAGE_URL];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map[FIREBASE_NAME] = this.name;
    map[FIREBASE_IMAGE_URL] = this.imageurl;
    return map;
  }
}
