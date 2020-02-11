import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:vector_math/vector_math_64.dart';

class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({Key key, this.child}) : super(key: key);

  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();
  Matrix4 zerada = Matrix4.identity();
  Matrix4 zoom = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          print("matrix.dereminant = ${matrix.determinant()}");
          print("zerada.determinant = ${zerada.determinant()}");
          print("zoom.determinant = ${zoom.determinant()}");
          matrix = matrix.determinant() > zerada.determinant() ? zerada : zoom;
        });
      },
      child: MatrixGestureDetector(
        shouldRotate: false,
        shouldScale: matrix.determinant() >= zerada.determinant() && matrix.determinant() < zerada.determinant() * 2 ,
        shouldTranslate: matrix.determinant() >= zerada.determinant() * 1.5,
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            //print(m);
            if (m.determinant() < zerada.determinant()) {
              matrix = zerada;
            } else if (matrix.determinant() >= zerada.determinant() * 2) {
              zoom = m;
              matrix = zoom;
              print('zoom = ${zoom}');
              print(m);
            } else {
              matrix = m;
            }
          });
        },
        child: Transform(
          transform: matrix,
          child: widget.child,
        ),
      ),
    );
  }
}
