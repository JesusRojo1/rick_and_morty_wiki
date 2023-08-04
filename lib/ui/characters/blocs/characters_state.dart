part of 'characters_bloc.dart';

class CharactersState extends Equatable {
  final CharactersModel? resCharactersModel;

  const CharactersState({this.resCharactersModel});

  CharactersState copyWith({CharactersModel? resCharactersModel}) =>
      CharactersState(
          resCharactersModel: resCharactersModel ?? this.resCharactersModel);

  @override
  List<Object?> get props => [resCharactersModel];

  @override
  String tostring() => "{resCharactersModel: $resCharactersModel}";
}

class CharactersInitial extends CharactersState {}
