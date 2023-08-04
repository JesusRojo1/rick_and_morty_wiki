import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/constants.dart';

class MenuButton extends StatelessWidget {
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final Radius? topRight;
  final Radius? topLeft;
  final Radius? bottomRight;
  final Radius? bottomLeft;
  final String? image;
  final String? title;
  final double? scaleImage;
  final Function() onTap;

  const MenuButton(
      {super.key,
      this.color,
      this.mainAxisAlignment,
      this.topRight,
      this.topLeft,
      this.bottomRight,
      this.bottomLeft,
      this.image,
      this.title,
      this.scaleImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          Container(
            height: Constants.heightMenuButton,
            width: Constants.widthMenuButton,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topRight: topRight ?? const Radius.circular(0.0),
                bottomRight: bottomRight ?? const Radius.circular(0.0),
                topLeft: topLeft ?? const Radius.circular(0.0),
                bottomLeft: bottomLeft ?? const Radius.circular(0.0),
              ),
            ),
            child: Row(
              children: [
                Image.asset(image ?? "", scale: scaleImage ?? 1),
                Text(
                  title ?? "",
                  style: const TextStyle(color: Constants.secondaryWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
