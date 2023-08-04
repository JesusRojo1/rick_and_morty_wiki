import 'package:flutter/material.dart';

import '../constants.dart';

class GlobalInput extends StatelessWidget {
  final String? holdPlace;
  final Color? labelColor;
  final bool isSearch;
  final String? fontFamily;
  final double? fontSize;
  final Color? borderColor;
  final TextEditingController inputController;
  final Function validator;
  final String? placeHolder;

  const GlobalInput({
    super.key,
    required this.inputController,
    required this.isSearch,
    this.holdPlace,
    this.labelColor,
    this.fontFamily,
    this.fontSize,
    this.borderColor,
    required this.validator,
    this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      cursorColor: Constants.primaryGreenStrong,
      style: TextStyle(
        color: Constants.primaryGreen,
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: Constants.sizeHeightLabel,
      ),
      decoration: InputDecoration(
        hintText: placeHolder,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: Constants.borderSideWidth,
              color: borderColor ?? Constants.primaryGreenStrong),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.primaryGreenStrong),
        ),
      ),
      onChanged: (value) {
        validator(value);
      },
    );
  }
}
