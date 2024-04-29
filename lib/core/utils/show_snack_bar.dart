
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_pallete.dart';

void ErrorShowSnackBar(BuildContext context, String text,){
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
      content:Container(padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppPallete.color1,
          borderRadius: BorderRadius.all(Radius.circular(10)),

        ),
        child: Row(
          children: [
            Icon(Icons.error_outline_rounded,color:AppPallete.color2,size: 40,),
            SizedBox(width: 8)
            ,Expanded(child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text("Error:",style:GoogleFonts.poppins().copyWith(fontSize: 18,color:AppPallete.color2),)
              ,Text(text,style:GoogleFonts.poppins().copyWith(fontSize: 12,color:AppPallete.color2),)

            ],
            ))
          ],
        ),
      ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppPallete.transparent,
    elevation: 0,
  ));

}