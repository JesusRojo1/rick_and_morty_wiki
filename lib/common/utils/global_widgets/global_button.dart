
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/height_font_label.dart';

import '../constants.dart';

class GlobalButton extends StatelessWidget {
  final String? label;
  final Color? color;
  final void Function()? action;
  final double? fontSize;
  final Color labelColor;
  final IconData? icon;
  final double bottom;
  final double? height;
  final double? width;
  final double top;
  final double left;
  final double right;
  final bool padding;
  final bool shape;
  final double radius;
  final Key? keyButton;
  final FontWeight? fontWeight;
  final Color? disabledBackgroundColor;
  final Color? backgroundColor;
  final IconData? iconRightTitle;

  const GlobalButton(
      {Key? key,
        this.label = "",
        this.color,
        required this.action,
        this.fontSize,
        this.labelColor = Constants.secondaryWhite,
        this.icon,
        this.bottom = 0.0,
        this.top = 0.0,
        this.padding = false,
        this.keyButton,
        this.left = 0.0,
        this.right = 0.0,
        this.shape = false,
        this.radius = 4.0,
        this.fontWeight,
        this.disabledBackgroundColor,
        this.height,
        this.width,
        this.backgroundColor,
        this.iconRightTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        key: keyButton,
        onPressed: action,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: disabledBackgroundColor,
          backgroundColor: backgroundColor,
          shape: shape ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)) : null,
        ),
        child: Container(
          padding: padding
              ? EdgeInsets.only(
            top: top,
            bottom: bottom,
            right: right,
            left: left,
          )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: icon != null ? Constants.sizeOfSizeBox : 0),
              if (icon != null) Icon(icon),
              if (icon == null && iconRightTitle != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        label ?? "",
                        style: TextStyle(
                          fontSize: fontSize,
                          color: labelColor,
                          fontWeight: fontWeight,
                          height: 26.0.toFontSizeHeight(16),
                        ),
                      ),
                    ),
                    Icon(iconRightTitle, color: Constants.secondaryWhite)
                  ],
                ),
              if (icon == null && iconRightTitle == null)
                Flexible(
                  child: Text(
                    label ?? "",
                    style: TextStyle(
                      fontSize: fontSize,
                      color: labelColor,
                      fontWeight: fontWeight,
                      height: 26.0.toFontSizeHeight(fontSize ?? 16.0),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}