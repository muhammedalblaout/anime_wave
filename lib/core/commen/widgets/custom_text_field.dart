import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final TextEditingController textEditingController;
  bool isPassword;


  CustomTextField(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.isPassword, required this.textEditingController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueNotifier<bool> _textFiledIsFocused = ValueNotifier(false);

  late final FocusNode _textFieldFocus = FocusNode()
    ..addListener(() {
      _textFiledIsFocused.value = _textFieldFocus.hasFocus;
    });
  bool isUnVisible = false;

  @override
  void initState() {
    isUnVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _border([Color color = AppPallete.transparent]) => OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        );
    return ValueListenableBuilder<bool>(
      valueListenable: _textFiledIsFocused,
      builder: (context, value, child) => Theme(
        data: ThemeData(
            primaryColor: AppPallete.text_field_background,
            inputDecorationTheme: InputDecorationTheme(
                border: _border(),
                focusedBorder: _border(),
                errorBorder: _border(AppPallete.error),
                hintStyle: GoogleFonts.poppins().copyWith(
                    color: AppPallete.text_field_text, fontSize: 12.0),

            )),
        child: TextFormField(
          controller: widget.textEditingController,
          obscureText: isUnVisible,
          focusNode: _textFieldFocus,
          decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isUnVisible
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_sharp,
                        color: value
                            ? AppPallete.color1
                            : AppPallete.text_field_text,
                      ),
                      onPressed: () {
                        setState(() {
                          isUnVisible = !isUnVisible;
                        });
                      },
                    )
                  : null,
              prefixIcon: Icon(
                widget.icon,
                color: value ? AppPallete.color1 : AppPallete.text_field_text,
              ),
              fillColor: value
                  ? AppPallete.color1.withOpacity(0.1)
                  : AppPallete.text_field_background,
              filled: true,
              focusedBorder: _border(AppPallete.color1),
              border: _border()),
          style: GoogleFonts.poppins()
              .copyWith(color: AppPallete.color2, fontSize: 12.0),
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.hint} is missing";
            }
            return null;
          },
        ),
      ),
    );
  }
}
