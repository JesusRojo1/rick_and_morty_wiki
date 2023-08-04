import 'package:flutter/material.dart';

import '../../../common/utils/constants.dart';

class ItemCharacter extends StatelessWidget {
  final String? image;
  final double? scaleImage;
  final String? name;
  final String? status;
  final String? specie;

  const ItemCharacter({
    super.key,
    this.image,
    this.scaleImage,
    this.name,
    this.status,
    this.specie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.widthItemCard,
      height: Constants.heightItemCard,
      child: Card(
        color: Constants.primaryGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.network(
                  image ?? "",
                  scale: scaleImage ?? 1,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              width: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Name: ",
                      style: TextStyle(color: Constants.primaryBlack),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        name ?? "N/A",
                        softWrap: true,
                        style: const TextStyle(color: Constants.primaryBlack),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Status: ",
                      style: TextStyle(color: Constants.primaryBlack),
                    ),
                    Text(
                      status ?? "N/A",
                      style: const TextStyle(color: Constants.primaryBlack),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Speacie: ",
                      style: TextStyle(color: Constants.primaryBlack),
                    ),
                    Text(
                      specie ?? "N/A",
                      style: const TextStyle(color: Constants.primaryBlack),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
