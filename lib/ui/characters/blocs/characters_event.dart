part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  const CharactersEvent();
}

class GetAllCharacters extends CharactersEvent {
  final dynamic resCharactersModel;

  const GetAllCharacters(this.resCharactersModel);

  @override
  List<Object?> get props => [resCharactersModel];
}
