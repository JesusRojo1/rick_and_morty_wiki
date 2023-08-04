import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/utils/constants.dart';

class ItemEpisodes extends StatefulWidget {
  final String? title;
  final String? episode;
  final String? url;
  final dynamic data;

  const ItemEpisodes(
      {super.key, this.data, this.title, this.episode, this.url});

  @override
  ItemEpisodesState createState() => ItemEpisodesState();
}

class ItemEpisodesState extends State<ItemEpisodes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.widthItemEpisodeCard,
      height: Constants.heightItemEpisodeCard,
      child: Card(
        color: Constants.primaryGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title ?? "",
                      style: const TextStyle(color: Constants.secondaryWhite),
                      softWrap: true,
                    ),
                  ],
                )),
            Text(
              widget.episode ?? "",
              style: const TextStyle(color: Constants.secondaryWhite),
              softWrap: true,
            ),
            RichText(
              softWrap: true,
              text: TextSpan(
                  text: "Watch episode",
                  style: const TextStyle(
                      color: Constants.secondaryBlue,
                      decoration: TextDecoration.underline,
                      decorationColor: Constants.secondaryBlue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse(widget.url ?? ""),
                      );
                    }),
            ),
          ],
        ),
      ),
    );
  }
}
