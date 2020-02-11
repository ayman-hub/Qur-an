import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_body.dart';
import 'package:moshaf/feature/presentaion/ui/pages/watch/watch_page.dart';
import 'package:moshaf/router.gr.dart';

import '../../../../../injection.dart';

class VideoBodyWidget extends StatefulWidget {
  VideoBodyWidget({Key key, @required this.name}) : super(key: key);
  String name;

  @override
  _VideoBodyWidgetState createState() {
    return _VideoBodyWidgetState();
  }
}

class _VideoBodyWidgetState extends State<VideoBodyWidget> {
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
    return StreamBuilder(
        stream: sl<CaseGetAllBody>().getAllSorah(widget.name),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );

          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text('no internet connection'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = snapshot.data ?? List();
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: Card(
                    elevation: 8,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colors.brown[100],
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Image.network(
                            'http://i3.ytimg.com/vi/${list[index].url}/hqdefault.jpg',
                            scale: 3,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            list[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Divider(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Router.navigator.pushNamed(Router.watchPage,
                      arguments: WatchPageArguments(
                          entities: list[index], listEntities: list))

                  /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WatchPage(
                          entities: list[index],
                          listEntities: list,
                        ))),*/
                  );
            },
          );
        });
  }
}
