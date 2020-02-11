import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_page.dart';
import 'package:moshaf/feature/domain/use_cases/case_save_page_num.dart';
import 'package:moshaf/feature/presentaion/ui/pages/read/body_quran_page.dart';
import 'package:moshaf/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNumWidget extends StatefulWidget {
  PageNumWidget({Key key, @required this.type}) : super(key: key);
  PageType type;

  @override
  _PageNumWidgetState createState() {
    return _PageNumWidgetState();
  }
}

class _PageNumWidgetState extends State<PageNumWidget> {
  final pageFormKey = GlobalKey<FormState>();
  final gzFormKey = GlobalKey<FormState>();
  int pageNum = 0;
  int gzNum = 1;
  List<ReadEntities> allData = sl<CaseGetAllPage>().getPages(QURAN_PAGE);

  ReadEntities get specificPage {
    ReadEntities getData;
    allData.forEach((data) {
      if (gzNum == data.gzNum ?? 0) {
        getData = data;
      }
    });
    return getData;
  }

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
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' رقم الصفحة',
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            Form(
              key: pageFormKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.pages,color: Colors.brown,),
                        hintText: 'page num ',
                        labelText: 'Num from 0 to 604 *',
                      ),
                      onFieldSubmitted: (String value) {
                        if (pageFormKey.currentState.validate())
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => BodyQuranPage(
                                  data: ReadEntities(
                                      sorah: null,
                                      imageUrl: null,
                                      pageNum: pageNum),
                                  listData:
                                      sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                                  type: PageType.QURAN_PAGE)));
                      },
                      onChanged: (String value) {
                        setState(() {
                          pageNum = int.parse(value);
                        });
                      },
                      validator: (String value) {
                        if (value.isEmpty ||
                            int.parse(value) < 0 ||
                            int.parse(value) > 604) {
                          return 'Num is required. between 0 to 604';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown[300],
                    ),
                    child: FlatButton.icon(
                      icon: Icon(Icons.search),
                      textColor: Colors.amber,
                      label: Text('OK'),
                      onPressed: () {
                        if (pageFormKey.currentState.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BodyQuranPage(
                                  data: ReadEntities(
                                      sorah: null,
                                      imageUrl: null,
                                      pageNum: pageNum),
                                  listData:
                                      sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                                  type: PageType.QURAN_PAGE),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height:5,
              color: Colors.brown,
            ),
            Text(
              ' رقم الجزء',
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            Form(
              key: gzFormKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.pages,color: Colors.brown,),
                        hintText: 'page num ',
                        labelText: 'Num from 1 to 30 *',
                      ),
                      onFieldSubmitted: (String value) {
                        if (gzFormKey.currentState.validate())
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => BodyQuranPage(
                                  data: specificPage,
                                  listData:
                                      sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                                  type: PageType.QURAN_PAGE)));
                      },
                      onChanged: (String value) {
                        setState(() {
                          gzNum = int.parse(value);
                        });
                      },
                      validator: (String value) {
                        if (value.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 30) {
                          return 'Num is required. between 1 to 30';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown[300],
                    ),
                    child: FlatButton.icon(
                      icon: Icon(Icons.search),
                      textColor: Colors.amber,
                      label: Text('OK'),
                      onPressed: () {
                        if (gzFormKey.currentState.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BodyQuranPage(
                                  data: specificPage,
                                  listData:
                                      sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                                  type: PageType.QURAN_PAGE),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.brown,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BodyQuranPage(
                      data: ReadEntities(
                          sorah: null,
                          imageUrl: null,
                          pageNum: sl<CaseSetAndGetPageNum>()
                              .getSavedPageNum(widget.type)),
                      listData: sl<CaseGetAllPage>().getPages(QURAN_PAGE),
                      type: PageType.QURAN_PAGE),
                ),
              ),
              child: Container(
                width: 100,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('images/fasel.jpg',scale: 20,),
                    Text('الفاصل',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              textColor: Colors.amberAccent,
              color: Colors.brown[300],
            ),
          ],
        ),
      ),
    );
  }
}
