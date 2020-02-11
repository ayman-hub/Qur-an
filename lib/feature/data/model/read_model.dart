import 'dart:convert';

import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:flutter/material.dart';

class ReadModel extends ReadEntities {
  int pageNum;
  String sorah;
  Image imageUrl;
  int gzNum;

  ReadModel(
      {@required this.pageNum, @required this.sorah, @required this.imageUrl,this.gzNum})
      : super(pageNum: pageNum, sorah: sorah, imageUrl: imageUrl,gzNum:gzNum);

/*  ReadModel.map(Map<String, dynamic> map) {
    this.pageNum = map[PAGE_NUM];
    this.sorah = map[SORAH];
    this.imageUrl = map[PAGES] is String ? map[PAGES] : base64Encode(map[PAGES]) ;
  }

  Future<Map<String, dynamic>> toMap()async {
    Map<String, dynamic> map = Map<String, dynamic>();
    map[PAGE_NUM] = this.pageNum;
    map[SORAH] = this.sorah;
    map[PAGES] = await networkImageToByte(this.imageUrl);

    return map;
  }*/

}
