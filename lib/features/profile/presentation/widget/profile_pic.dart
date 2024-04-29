import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

Widget ProfilePic(String avatarurl, {required VoidCallback onTap}) {


  return new Container(
    child: Stack(
      children: [
        Container(
          child: Image.network(
              "${avatarurl}?${DateTime.now().millisecondsSinceEpoch.toString()}",
              fit: BoxFit.cover),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(50),
            color: AppPallete.grard1,// Adjust the radius as needed
              ),
          width: 94,
          height: 94,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox(
            width: 24,
            height: 24,
            child: ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppPallete.color1),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: Icon(
                size: 14,
                Icons.edit,
                color: AppPallete.color2,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
