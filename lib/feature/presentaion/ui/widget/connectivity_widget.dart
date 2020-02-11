import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:moshaf/feature/presentaion/ui/widget/listen/show_body_widget.dart';
import 'package:flutter/material.dart';


class Connectivity extends StatelessWidget {
 final Widget child;
 final Function getOnline;

  Connectivity({Key key, @required this.child, @required this.getOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidget(
      onlineCallback: () => getOnline,
      builder: (context, isOnline) => isOnline
          ? child
          : Center(
              child: Container(
                child: Text(
                  'no connection',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
    );
  }
}
