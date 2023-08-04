import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/appbar_custom.dart';
import 'package:rick_and_morty_show/ui/home/views/animate_menu_button.dart';
import 'package:rick_and_morty_show/ui/home/views/menu_button.dart';

import '../../../common/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    final sizeHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: const AppBarCustom(
        backgroudColor: Constants.primaryGreenLight,
        showBackButton: false,
        loguot: true,
      ),
      body: WillPopScope(
        onWillPop: _onWillScope,
        child: Container(
          width: sizeWidth,
          height: sizeHeight,
          color: Constants.primaryWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimateMenuButton(
                color: Constants.secondaryBlue,
                mainAxisAlignment: MainAxisAlignment.start,
                topRight: Constants.radiusMenuButton,
                bottomRight: Constants.radiusMenuButton,
                beginAnimation: Constants.animateMBtnToBR,
                endAnimation: Constants.animateMBtnToER,
                image: "assets/images/pickle-rick.png",
                title: "Characters",
                scaleImage: 1,
                onTap: () => Navigator.pushNamed(context, "/characters"),
              ),
              AnimateMenuButton(
                color: Constants.secondaryYellow,
                mainAxisAlignment: MainAxisAlignment.end,
                topLeft: Constants.radiusMenuButton,
                bottomLeft: Constants.radiusMenuButton,
                beginAnimation: Constants.animateMBtnToBL,
                endAnimation: Constants.animateMBtnToER,
                image: "assets/images/rick-morty-episodes.png",
                title: "Episodes",
                scaleImage: 2.5,
                onTap: () => Navigator.pushNamed(context, "/episodes"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillScope() async {
    return false;
  }
}
