import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ReadEntities extends Equatable {
  int pageNum;
  String sorah;
  Image imageUrl;
  int gzNum;

  ReadEntities(
      {@required this.sorah, @required this.imageUrl, @required this.pageNum,this.gzNum});

  @override
  List<Object> get props => [sorah, imageUrl, pageNum,gzNum];
}
