import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loader extends StatelessWidget {
  final Color _color;
  Loader({ Key? key,
    required Color color,
  }) : _color =color, super(key: key);


  @override
  Widget build(BuildContext context) {

    return Center(child: Container(
      width: 50,
      height: 50,
      child: LoadingIndicator(
          indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
          colors:  [_color],       /// Optional, The color collections
         /// Optional, the stroke backgroundColor
      ),
    ),);
  }
}
