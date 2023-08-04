import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_show/ui/characters/models/characters_model.dart';

import '../providers/api_provider.dart';

part 'characters_event.dart';

part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  ApiProvider apiProvider;
  late dynamic getData;

  CharactersBloc({required this.apiProvider}) : super(CharactersInitial()) {
    on<GetAllCharacters>(
      (event, emit) => emit(
        state.copyWith(resCharactersModel: event.resCharactersModel),
      ),
    );
  }

  Future getAllCharacters() async {
    final dynamic resGetAllCharacters =
        await apiProvider.getDataAllCharacters();
    try {
      if (resGetAllCharacters.statusCode == 200) {
        return resGetAllCharacters;
      }
    } catch (error) {
      return resGetAllCharacters.response.statusCode;
    }
  }
}
