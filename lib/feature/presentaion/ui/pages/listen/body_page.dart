import 'dart:core';

import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/presentaion/ui/widget/connectivity_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/listen/show_body_widget.dart';
import 'package:flutter/material.dart';


class BodyPage extends StatefulWidget {
  NameEntities nameEntities;

  BodyPage({Key key, @required this.nameEntities}) : super(key: key);

  @override
  _BodyPageState createState() {
    return _BodyPageState();
  }
}

class _BodyPageState extends State<BodyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(widget.nameEntities.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(
                width: 10,
              ),
              Image.network(widget.nameEntities.imageurl),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      endDrawer: DrawerWidget(),
      body: Connectivity(
          getOnline: () => () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => BodyPage(nameEntities: widget.nameEntities,))),
          child: ShowBodyWidget(nameEntities: widget.nameEntities)),
    );
  }
}
