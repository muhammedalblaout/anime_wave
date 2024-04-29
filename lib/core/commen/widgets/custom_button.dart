import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomButton(String text, {required VoidCallback onPressed}) {
  return Container(
    width: 395,
    height: 55,
    clipBehavior: Clip.antiAlias,

    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[AppPallete.color1,AppPallete.color1_1],
        ),
      borderRadius: BorderRadius.circular(30),

    ),
    child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: AppPallete.transparent,
            shape: const StadiumBorder(),
            elevation: 0,
            backgroundColor: AppPallete.transparent,
            fixedSize: Size(395, 55)),
        child: Text(
          text,
          style:GoogleFonts.poppins().copyWith(fontSize: 18,fontWeight: FontWeight.w800,color: AppPallete.color2),
        )),
  );
}
