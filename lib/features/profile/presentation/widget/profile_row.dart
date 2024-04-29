import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ProfileRow(Color color,String text,IconData iconData){
  return  Container(
    color: AppPallete.backgroundColor,
    child: Row(
      children: [
        Row(children: [
          Icon(iconData,color: color),
          SizedBox(width: 20,),
          Text(
            text,
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 16, fontWeight: FontWeight.w500,color: color),
          ),
        ],
        ),
        Icon(Icons.arrow_forward_ios_rounded,color: color,),

      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
  );
}