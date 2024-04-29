import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget VideoButton({required IconData icon,required VoidCallback ontap} ){

  return  FloatingActionButton(
      onPressed: ontap,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Icon(icon,size: 50,),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ));
}