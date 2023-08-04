import 'package:flutter/material.dart';
import 'package:rick_and_morty_show/ui/characters/character/views/animate_character_card.dart';

import '../../../../common/utils/constants.dart';
import '../../../../common/utils/global_widgets/appbar_custom.dart';

class CharacterScreen extends StatelessWidget {
  static String routeName = "/character";

  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: const AppBarCustom(
        backgroudColor: Constants.primaryGreenLight,
        showBackButton: true,
        loguot: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image.network(data["image"]),
          ),
          AnimateCharacterCard(
            topRight: Constants.radiusCharacterCard,
            topLeft: Constants.radiusCharacterCard,
            beginAnimation: Constants.animateCardChrToBB,
            endAnimation: Constants.animateCardChrToEB,
            name: data["name"],
            status: data["status"],
            specie: data["species"],
            type: data["type"],
            gender: data["gender"],
            origin: data["origin"]["name"],
          )
        ],
      ),
    );
  }
}
