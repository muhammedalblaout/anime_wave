import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'blur_button.dart';

class ButtonHeader extends StatefulWidget {
  final VoidCallback onTap;
  final bool isfavorite;

  const ButtonHeader({super.key,required this.onTap, required this.isfavorite});

  @override
  State<ButtonHeader> createState() => _ButtonHeaderState();
}

class _ButtonHeaderState extends State<ButtonHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurButton(
          onTap: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
          isfavorite: false,
        ),
        BlurButton(
          onTap:widget.onTap,
          icon: Icons.favorite_border,
          isfavorite: widget.isfavorite,
        )
      ],
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
    );
  }
}
