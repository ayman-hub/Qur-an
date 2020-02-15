import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/router.gr.dart';

import 'feature/domain/use_cases/case_get_all_page.dart';
import 'injection.dart';

class SearchData extends SearchDelegate<String> {
  List<ReadEntities> data;
  PageType type;

  SearchData({this.data, this.type});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
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
    List<ReadEntities> suggestionList = query.isEmpty
        ? data
        : data.where((p) {
            int num = 0;
            query.split('').forEach((char) {
              if (!p.sorah.contains(char)) return;
              num++;
            });
            return num == query.length;
          }).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                  children:
                      getChooseChar(suggestionList[index].sorah.split(''))),
            ),
            onTap: () {
              type == PageType.QURAN_PAGE
                  ? Router.navigator.pushNamed(
                Router.bodyQuranPage,
                arguments: BodyQuranPageArguments(
                    data: suggestionList[index],
                    listData: sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                    type: PageType.QURAN_PAGE),
              )
                  : Router.navigator.pushNamed(
                Router.bodyQuranPage,
                arguments: BodyQuranPageArguments(
                    data: suggestionList[index],
                    listData: sl<CaseGetAllPage>().getPages(AZKAR_PAGE),
                    type: PageType.AZKAR_PAGE),
              );
            });
        });
  }

  List<TextSpan> getChooseChar(List<String> chars) {
    List<TextSpan> spans = List();
    chars.forEach((char) {
      spans.add(TextSpan(
          text: char,
          style: query.contains(char)
              ? TextStyle(color: Colors.black, fontWeight: FontWeight.w500 ,fontSize: 25)
              : TextStyle(color: Colors.grey , fontSize: 20)));
    });
    return spans;
  }
}
