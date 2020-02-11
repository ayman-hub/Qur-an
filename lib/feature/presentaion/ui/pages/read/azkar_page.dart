import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_page.dart';
import 'package:moshaf/feature/domain/use_cases/case_save_page_num.dart';
import 'package:moshaf/feature/presentaion/ui/widget/drawer_widget.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/body_quran_page.dart';
import 'package:flutter/material.dart';

import '../../../../../injection.dart';
import '../../../../../router.gr.dart';
import '../../../../../search.dart';

class AzkarPage extends StatelessWidget {
  AzkarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ReadEntities> data = List<ReadEntities>();
    sl<CaseGetAllPage>().getPages(AZKAR_PAGE).forEach((d) {
      if (d.sorah != null) {
        data.add(d);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Azkar'),
      ),
      endDrawer: DrawerWidget(),
      body: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: ListTile(
              title: Text('ابحث عن الدعاء',textDirection: TextDirection.rtl,style: TextStyle(fontWeight: FontWeight.w100,color: Colors.black38),),
              leading: Icon(Icons.search),
              onTap: (){
                showSearch(
                    context: context,
                    delegate:
                    SearchData(data: data, type: PageType.QURAN_PAGE));
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  color: Colors.brown[200],
                  child: ListTile(
                    title: Text(
                      data[index].sorah,
                      textDirection: TextDirection.rtl,
                    ),
                    onTap: () => Router.navigator.pushNamed(
                      Router.bodyQuranPage,
                      arguments: BodyQuranPageArguments(
                          data: data[index],
                          listData: sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                          type: PageType.AZKAR_PAGE),
                    )
                    /*Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BodyQuranPage(
                          data: data[index],
                          listData: sl<CaseGetAllPage>().getPages(AZKAR_PAGE),
                          type: PageType.AZKAR_PAGE,
                        ),
                      ),
                    ),*/
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
