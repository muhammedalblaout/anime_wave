import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget RichTextInfo(String sub ,String value){
  return RichText(text:TextSpan(text: sub,
    style: GoogleFonts.poppins().copyWith(fontSize: 12,color: AppPallete.color2,fontWeight:FontWeight.w500),
    children: [
      TextSpan(text: value,
      style: GoogleFonts.poppins().copyWith(fontSize: 12,color: AppPallete.color2.withOpacity(0.7),fontWeight:FontWeight.w400))
    ]
  ),);
}