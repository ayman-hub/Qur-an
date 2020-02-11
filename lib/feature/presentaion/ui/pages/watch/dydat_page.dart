import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/presentaion/ui/widget/connectivity_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/watch/video_body_widget.dart';
import 'package:flutter/material.dart';



class DeedatPage extends StatefulWidget {
  DeedatPage({Key key}) : super(key: key);

  @override
  _DeedatPageState createState() {
    return _DeedatPageState();
  }
}

class _DeedatPageState extends State<DeedatPage> {
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
    return Scaffold(
      endDrawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Image.asset('images/ahmed_deedat.jpg',scale:3),
            SizedBox(
              width: 10,
            ),
            Text('Ahmed Deedat', style: TextStyle(fontSize: 20)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: Connectivity(
          getOnline: () => () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => DeedatPage())),
          child: VideoBodyWidget(name: DEEDAT_COLLECTION)),
    );
  }
}
