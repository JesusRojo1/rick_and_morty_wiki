import 'package:flutter/cupertino.dart';

import '../../../../common/utils/constants.dart';

class CharacterDataCard extends StatelessWidget {
  final String? name;
  final String? origin;
  final String? gender;
  final String? status;
  final String? specie;
  final String? type;

  const CharacterDataCard(
      {super.key,
      this.name,
      this.origin,
      this.gender,
      this.status,
      this.specie,
      this.type});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    final sizeHeight = MediaQuery.sizeOf(context).height;
    return Container(
      height: sizeHeight * 0.50,
      width: sizeWidth * 0.95,
      decoration: const BoxDecoration(
        color: Constants.primaryGreenLight,
        borderRadius: BorderRadius.only(
          topRight: Constants.radiusCharacterCard,
          topLeft: Constants.radiusCharacterCard,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Name: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(name == "" ? "N/A" : name ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(status == "" ? "N/A" : status ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Specie: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(specie == "" ? "N/A" : specie ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Type: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(type == "" ? "N/A" : type ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Gender: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(gender == "" ? "N/A" : gender ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Origin: ",
                  style: TextStyle(color: Constants.primaryBlack),
                ),
                Text(origin == "" ? "N/A" : origin ?? "N/A",
                    style: const TextStyle(color: Constants.primaryBlack))
              ],
            ),
            Container(
              color: Constants.primaryGreenStrong,
              width: sizeWidth * 0.90,
              height: Constants.lineDivisorData,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
