import 'package:flutter/material.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/router.gr.dart';

import 'feature/domain/use_cases/case_get_all_page.dart';
import 'injection.dart';



class SearchData extends SearchDelegate<String> {
  List<ReadEntities> data;
  PageType type;

  SearchData({this.data,this.type});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {query = '';})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ReadEntities> suggestionList = query.isEmpty?data:data.where((p){
      int num = 0 ;
      query.split('').forEach((char){
        if(!p.sorah.contains(char))return;
        num++;
      });
      return num == query.length ;

    }).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(suggestionList[index].sorah,textDirection: TextDirection.rtl,),
            onTap: (){
            type == PageType.QURAN_PAGE ? Router.navigator.pushNamed(
              Router.bodyQuranPage,
              arguments: BodyQuranPageArguments(
                  data: data[index],
                  listData: sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                  type: PageType.QURAN_PAGE),
            ):Router.navigator.pushNamed(
              Router.bodyQuranPage,
              arguments: BodyQuranPageArguments(
                  data: data[index],
                  listData: sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                  type: PageType.AZKAR_PAGE),
            );
            },
          );
        });
  }
}