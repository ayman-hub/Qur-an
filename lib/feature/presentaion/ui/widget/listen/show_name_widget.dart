import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/router.gr.dart';

import '../../../../../injection.dart';

class ShowNameWidget extends StatelessWidget {
  ShowNameWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: sl<CaseGetAllName>().getAllName(),
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

          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.network(
                        snapshot.data[index].imageurl,
                        fit: BoxFit.cover,
                        scale: 2,
                      ),
                    ),
                    Text(
                      snapshot.data[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
                onTap: () {
                  Router.navigator.pushNamed(Router.bodyPage,
                      arguments: BodyPageArguments(
                          nameEntities: snapshot.data[index]));
                  /*   Navigator.of(context)
                      .pushNamed('/body', arguments: snapshot.data[index]);*/
                },
              );
            },
          );
        });
  }
}
