import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NameEntities extends Equatable {
  String name;
  String imageurl;

  NameEntities({@required this.name, @required this.imageurl});

  @override
  List<Object> get props => [name];
}
