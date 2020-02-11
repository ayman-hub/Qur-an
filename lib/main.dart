import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/injection.dart';
import 'package:moshaf/router.dart';
import 'package:moshaf/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  print('app initialize');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  getToken() async {
    List docs = List();
    _firebaseMessaging.getToken().then((token) async {
      print(token);
      await Firestore.instance.collection('tokens').getDocuments().then((doc) {
        doc.documents.forEach((data) async {
          docs.add(data['token']);
        });
      });
      if (docs.contains(token)) {
        print('there are one ');
        return;
      } else {
        await Firestore.instance.collection('tokens').add({'token': token});
      }
    });
  }

  @override
  void initState() {
    getToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityUtils.instance
        .setCallback((response) => response.contains("This is a test!"));
    ConnectivityUtils.instance.setServerToPing(
        "https://gist.githubusercontent.com/Vanethos/dccc4b4605fc5c5aa4b9153dacc7391c/raw/355ccc0e06d0f84fdbdc83f5b8106065539d9781/gistfile1.txt");
    return MaterialApp(
      title: 'المصحف',
      initialRoute: Router.quranPage,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
      theme: ThemeData(primaryColor: Colors.brown[400]),
      debugShowCheckedModeBanner: false,
    );
  }


}
