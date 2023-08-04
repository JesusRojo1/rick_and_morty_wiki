import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroudColor;
  final bool showBackButton;
  final bool loguot;

  const AppBarCustom(
      {super.key,
      required this.loguot,
      required this.backgroudColor,
      required this.showBackButton})
      : preferredSize = const Size.fromHeight(80);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroudColor,
      leading: showBackButton == true
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Constants.primaryBlack,
              ),
            )
          : loguot == true
              ? IconButton(
                  onPressed: () => Navigator.pushNamed(context, "/login"),
                  icon: const Icon(
                    Icons.login_outlined,
                    color: Constants.primaryBlack,
                  ),
                )
              : const SizedBox(),
      actions: [
        Image.asset(
          'assets/images/title-rick-and-morty.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
