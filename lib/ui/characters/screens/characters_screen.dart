import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/global_input.dart';
import 'package:rick_and_morty_show/ui/characters/blocs/characters_bloc.dart';
import 'package:rick_and_morty_show/ui/characters/views/item_character.dart';

import '../../../common/utils/constants.dart';
import '../../../common/utils/global_widgets/appbar_custom.dart';
import '../../../common/utils/global_widgets/loading_view.dart';

final TextEditingController _controllerQuery = TextEditingController();

class CharactersScreen extends StatefulWidget {
  static String routeName = "/characters";

  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharactersBloc resCharactersBloc;
  dynamic data;
  List<dynamic> takeData = [];
  List<dynamic> filteredData = [];

  @override
  void initState() {
    resCharactersBloc = BlocProvider.of<CharactersBloc>(context, listen: false);
    getAllCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    final sizeHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: const AppBarCustom(
        backgroudColor: Constants.primaryGreenLight,
        showBackButton: true,
        loguot: false,
      ),
      body: Column(
        children: [
          Container(
            margin: Constants.marginContainer6,
            color: Constants.secondaryWhite,
            width: sizeWidth,
            height: sizeHeight * 0.06,
            child: GlobalInput(
              inputController: _controllerQuery,
              isSearch: true,
              placeHolder: "Search Character...",
              validator: searchQuery,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (context, index) {
                      return data == null
                          ? const Center(
                              child: Text(
                                "No records of the characters exist.",
                                style: TextStyle(
                                    color: Constants.primaryGreenStrong),
                              ),
                            )
                          : InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, "/character",
                                  arguments: data[index]),
                              child: ItemCharacter(
                                  image: data[index]["image"],
                                  scaleImage: 2,
                                  name: data[index]["name"],
                                  status: data[index]["status"],
                                  specie: data[index]["species"]),
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

  void searchQuery(String query) {
    filteredData = List.of(data);
    if (query == "") {
      filteredData = List.of(takeData);
    }
    dynamic filteredList = filteredData.where((item) {
      final name = item["name"];
      final input = query.toLowerCase();
      return name.toLowerCase().contains(input);
    }).toList();

    setState(() {
      data = filteredList;
    });
  }

  getAllCharacters() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await LoadingView(context).show();
    });
    final resGetAllCharacters = await resCharactersBloc.getAllCharacters();
    try {
      if (resGetAllCharacters.statusCode == 200) {
        setState(() {
          data = resGetAllCharacters.data["results"];
          takeData = List.of(data);
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
