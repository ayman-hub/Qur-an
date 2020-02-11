import 'package:moshaf/feature/data/remote_data_source/RemoteDataSource.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_body.dart';
import 'package:moshaf/feature/presentaion/ui/pages/listen/play_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/router.gr.dart';

import '../../../../../injection.dart';

class ShowBodyWidget extends StatelessWidget {
  final NameEntities nameEntities;

  ShowBodyWidget({Key key, @required this.nameEntities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: sl<CaseGetAllBody>().getAllSorah(nameEntities.name),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = snapshot.data ?? List();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                color: Colors.brown[100],
                child: ListTile(
                  title: Text(
                    list[index].name,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  onTap: () {
                    Router.navigator.pushNamed(Router.playPage,
                        arguments: PlayPageArguments(
                          Index: index,
                          list: list,
                          name: nameEntities.name,
                        ));
                    /*  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PlayPage(
                          Index: index,
                          list: list,
                          name: nameEntities.name,
                        ),
                      ),
                    );*/
                  },
                ),
              );
            },
          );
        });
  }
}
