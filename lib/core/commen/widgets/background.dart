
import 'dart:ui';

import 'package:flutter/material.dart';

Widget BackgroundFade(Color color, String Image_url){
  return Stack(
    children: [
      Container(
        width: double.infinity,
        child: ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child:Image.network(Image_url,fit: BoxFit.fitWidth,),
          ),
        ),
      ),
      Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [Colors.transparent,color],
                stops: [0, .5]
            )
        ),
      ),
    ],);
}