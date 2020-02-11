import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:moshaf/router.gr.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Container(
        color: Colors.brown[100],
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/ayat.png')),
              ),
            ),
            InkWell(
              onTap: () => goToWidget(context, Router.quranPage),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  Icon(
                    Icons.chrome_reader_mode,
                    color: Colors.brown,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'قراءة',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () => goToWidget(context, Router.azkarPage),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  Icon(
                    Icons.chrome_reader_mode,
                    color: Colors.brown,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'أذكار الصباح و المساء ',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () => goToWidget(context, Router.listenPage),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  Icon(
                    Icons.library_music,
                    color: Colors.brown,
                    size: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'استماع',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () => goToWidget(context, Router.zakerPage),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  Image.asset('images/zaker_nayek.jpg',scale: 7,),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'ذاكر نايك',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            InkWell(
              onTap: () => goToWidget(context, Router.deedatPage),
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                  ),
                  Image.asset('images/ahmed_deedat.jpg',scale: 4,),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'احمد ديدات',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  goToWidget(BuildContext context, String router) {
    Navigator.pop(context);
   // Navigator.of(context).pushReplacementNamed(name);
    Router.navigator.pushNamed(router);
  }
}
