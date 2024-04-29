import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_pallete.dart';

class BlurButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isfavorite;
  const BlurButton({super.key, required this.onTap, required this.icon, required this.isfavorite});

  @override
  State<BlurButton> createState() => _BlurButtonState();
}

class _BlurButtonState extends State<BlurButton> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed:widget.onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor:
          MaterialStateProperty.all<Color>(widget.isfavorite?AppPallete.color1.withOpacity(0.5):AppPallete.backgroundColor.withOpacity(0.5)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child:  Icon(widget.icon,color:AppPallete.color2,),
      ),
    );
  }
}
