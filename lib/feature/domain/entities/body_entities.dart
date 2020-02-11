import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BodyEntities extends Equatable {
  String name;
  String url;

  BodyEntities({@required this.name, @required this.url});

  @override
  List<Object> get props => [name, url];
}
