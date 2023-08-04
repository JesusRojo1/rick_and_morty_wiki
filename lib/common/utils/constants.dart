import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Constants {
  static const primaryGreenLight = Color(0xffa7cb54);
  static const primaryGreen = Color(0xff5cad4a);
  static const primaryGreenStrong = Color(0xff208d44);
  static const primaryWhite = Color(0xfff0f2eb);
  static const primaryBlack = Color(0xff0d0d0d);

  static const secondaryWhite = Color(0xffffffff);
  static const secondaryBlack = Color(0xff000000);
  static const secondaryBlue = Color(0xffa6eee6);
  static const secondaryYellow = Color(0xfffafd7c);
  static const secondaryGreen = Color(0xff526e2d);
  static const secondaryRose = Color(0xfffb6467);
  static const secondaryPink = Color(0xffe762d7);

  static const thirdGrey = Color(0xffd3d3d3);

  //Scaffold-View
  static const EdgeInsets marginContainer16 =
      EdgeInsets.only(left: 16.0, right: 16.0);

  //Login
  static const double titleImageScale = 1;

  //global_input
  static const double sizeHeightLabel = 1.5;
  static const double borderSideWidth = 3;
  static const EdgeInsets marginContainer6 =
      EdgeInsets.only(left: 6.0, right: 6.0);

  //global_button
  static const double sizeOfSizeBox = 8;
  static const double heightButton = 60;

  //menu_button
  static const double widthMenuButton = 290;
  static const double heightMenuButton = 200;
  static const Radius radiusMenuButton = Radius.circular(40.0);
  static const Offset animateMBtnToBR = Offset(-1, 0);
  static const Offset animateMBtnToER = Offset(0, 0);
  static const Offset animateMBtnToBL = Offset(1, 0);
  static const Offset animateMBtnToEL = Offset(0, 0);

  //item_card_character
  static const double widthItemCard = 300;
  static const double heightItemCard = 210;

  //character_screen_data
  static const Radius radiusCharacterCard = Radius.circular(40.0);
  static const Offset animateCardChrToBB = Offset(0, 0.3);
  static const Offset animateCardChrToEB = Offset(0, 0);
  static const double lineDivisorData = 1.5;

  //list_episode_style
  static const EdgeInsets paddingAll16 = EdgeInsets.all(16.0);

  //item_episode
  static const double widthItemEpisodeCard = 300;
  static const double heightItemEpisodeCard = 80;
}
