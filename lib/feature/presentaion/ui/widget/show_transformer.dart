import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class ShowTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    var dim = info.position.isNegative ? info.position * -1 : info.position;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: child,
      margin: EdgeInsets.all(dim * 80),
    );
  }
}

