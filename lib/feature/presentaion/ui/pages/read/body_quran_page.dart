import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:moshaf/feature/domain/use_cases/case_save_page_num.dart';
import 'package:moshaf/feature/presentaion/ui/widget/read/zoom_page.dart';
import 'package:moshaf/feature/presentaion/ui/widget/show_transformer.dart';
import 'package:moshaf/feature/presentaion/ui/widget/toast_utils.dart';
import 'package:moshaf/injection.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class BodyQuranPage extends StatefulWidget {
  BodyQuranPage(
      {Key key,
      @required this.data,
      @required this.listData,
      @required this.type})
      : super(key: key);
  ReadEntities data;
  List<ReadEntities> listData;
  PageType type;

  @override
  _BodyQuranPageState createState() {
    return _BodyQuranPageState();
  }
}

class _BodyQuranPageState extends State<BodyQuranPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double foo = 0.0;
  int saveNum;

  @override
  Widget build(BuildContext context) {
    List<ReadEntities> allData = List();
    for (int i = 0; i < widget.listData.length; i++) {
      if (i == 0) {
        allData.add(widget.listData[i]);
      } else if (widget.listData[i].pageNum !=
              widget.listData[i - 1]?.pageNum ??
          null) {
        allData.add(widget.listData[i]);
      }
    }
    ;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ayat.png'),
          ),
          color: Colors.brown[100]),
      child: Stack(
        children: <Widget>[
          TransformerPageView(
            itemCount: allData.length,
            transformer: ShowTransformer(),
            itemBuilder: (context, index) {
              saveNum = index + 1;
              return Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(color: Colors.white),
                child: ZoomableWidget(
                  child: allData[index].imageUrl,
                ),
              );
            },
            index: widget.data?.pageNum - 1 ?? 0,
          ),
          widget.type == PageType.QURAN_PAGE
              ? Positioned(
                  left: MediaQuery.of(context).size.width / 2,
                  bottom: MediaQuery.of(context).size.height - 50,
                  child: GestureDetector(
                    onTap: () {
                      showToast('اسحب لاسفل');
                    },
                    onPanUpdate: (d) {
                      print(d.globalPosition.dy);
                      setState(() {
                        if (foo >= 100) {
                          sl<CaseSetAndGetPageNum>()
                              .setPageNum(widget.type, saveNum);
                          widget.type == PageType.QURAN_PAGE
                              ? showToast('the pageNum : ${saveNum} saved')
                              : showToast('the pageNum : ${saveNum + 5} saved');
                          foo = 0.0;
                        } else {
                          foo = d.globalPosition.dy + 30;
                        }
                      });
                    },
                    child: Container(
                      child: Transform.translate(
                        offset: Offset(0.0, foo >= 100 ? 0.0 : foo),
                        child: Image.asset(
                          'images/fasel.jpg',
                          scale: 5,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
