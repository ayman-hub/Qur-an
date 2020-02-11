import 'dart:core' as prefix1;
import 'dart:core';

import 'package:moshaf/feature/domain/use_cases/case_get_all_name.dart';
import 'package:moshaf/feature/presentaion/ui/widget/connectivity_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/listen/show_name_widget.dart';
import 'package:moshaf/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListenPage extends StatefulWidget {
  ListenPage({Key key}) : super(key: key);

  @override
  _ListenPageState createState() {
    return _ListenPageState();
  }
}

class _ListenPageState extends State<ListenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    sl<CaseGetAllName>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Listen'),
      ),
      endDrawer: DrawerWidget(),
      body: Container(
        child: Connectivity(
            getOnline: () => Navigator.of(context).pushNamed('/*'),
            child:
                ShowNameWidget()),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
