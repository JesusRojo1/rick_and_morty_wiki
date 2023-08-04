import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_show/ui/episodes/blocs/episode_bloc.dart';
import 'package:rick_and_morty_show/ui/episodes/views/item_episodes.dart';

import '../../../common/utils/constants.dart';
import '../../../common/utils/global_widgets/appbar_custom.dart';
import '../../../common/utils/global_widgets/loading_view.dart';
import '../views/videos.dart';

class EpisodesScreen extends StatefulWidget {
  static String routeName = "/episodes";

  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  late EpisodeBloc resEpisodesBloc;
  final listEpisodes = [];
  dynamic data;

  @override
  void initState() {
    resEpisodesBloc = BlocProvider.of<EpisodeBloc>(context, listen: false);
    getAllEpisodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    parseDataToList();
    return Scaffold(
      appBar: const AppBarCustom(
        backgroudColor: Constants.primaryGreenLight,
        showBackButton: true,
        loguot: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listEpisodes.length,
                    itemBuilder: (context, index) {
                      return ItemEpisodes(
                        title: listEpisodes[index].title,
                        episode: listEpisodes[index].episode,
                        url: listEpisodes[index].url,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  parseDataToList() {
    if (data != null) {
      final List<String> urls = [
        "https://rickymortylatino.online/buscando-las-semillas-1x01-piloto/",
        "https://rickymortylatino.online/invasion-canina-1x02/",
        "https://rickymortylatino.online/el-parque-anatomico-1x03/",
        "https://rickymortylatino.online/la-simulacion-alienigena-1x04/",
        "https://rickymortylatino.online/meeseeks-destructores-1x05/",
        "https://rickymortylatino.online/la-pocion-de-rick-1x06/",
        "https://rickymortylatino.online/criando-un-gazorpazorp-1x07/",
        "https://rickymortylatino.online/television-interdimensional-1x08/",
        "https://rickymortylatino.online/cosas-necesarias-1x09/",
        "https://rickymortylatino.online/encuentros-cercanos-a-lo-rick-1x10/",
        "https://rickymortylatino.online/es-hora-de-la-fiesta-1x11/",
        "https://rickymortylatino.online/una-rick-grieta-en-el-tiempo-2x01/",
        "https://rickymortylatino.online/morty-escapa-en-la-noche-2x02/",
        "https://rickymortylatino.online/asimilacion-autoerotica-2x03/",
        "https://rickymortylatino.online/rick-vengador-del-futuro-2x04/",
        "https://rickymortylatino.online/ponte-rickoso-2x05/",
        "https://rickymortylatino.online/los-ricks-deben-estar-locos-2x06/",
        "https://rickymortylatino.online/problemas-con-mini-rick-2x07/",
        "https://rickymortylatino.online/television-interdimensional-2-2x08/",
        "https://rickymortylatino.online/el-dia-de-la-purga-2x09/",
      ];
      int i = 0;
      for (var itemVideo in urls) {
        if (i <= urls.length) {
          final takeVideo = Video(
              title: data[i]["name"],
              episode: data[i]["episode"],
              url: itemVideo);
          listEpisodes.add(takeVideo);
          i++;
        }
      }
    }
  }

  getAllEpisodes() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await LoadingView(context).show();
    });
    final resGetAllEpisodes = await resEpisodesBloc.getAllEpisodes();
    try {
      if (resGetAllEpisodes.statusCode == 200) {
        setState(() {
          data = resGetAllEpisodes.data["results"];
        });
      }
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await LoadingView(context).dismiss();
      });
    } catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await LoadingView(context).dismiss();
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Constants.primaryGreenStrong,
          content: Text(
            "Oops! something went wrong, please try again later.",
            style: TextStyle(
              color: Constants.secondaryWhite,
            ),
          ),
        ),
      );
    }
  }
}
