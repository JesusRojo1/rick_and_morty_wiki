import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_show/ui/characters/character/screens/character_screen.dart';
import 'package:rick_and_morty_show/ui/characters/screens/characters_screen.dart';
import 'package:rick_and_morty_show/ui/episodes/screens/episodesScreen.dart';
import 'package:rick_and_morty_show/ui/home/screens/home_screen.dart';
import 'package:rick_and_morty_show/ui/login/screens/login_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  CharactersScreen.routeName: (context) => const CharactersScreen(),
  CharacterScreen.routeName: (context) => const CharacterScreen(),
  EpisodesScreen.routeName: (context) => const EpisodesScreen()
};
