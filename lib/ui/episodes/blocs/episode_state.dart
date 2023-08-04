part of 'episode_bloc.dart';

class EpisodeState extends Equatable {
  final EpisodesModel? resEpisodesModel;

  const EpisodeState({this.resEpisodesModel});

  EpisodeState copyWith({EpisodesModel? resEpisodesModel}) => EpisodeState(
      resEpisodesModel: resEpisodesModel ?? this.resEpisodesModel);

  @override
  List<Object?> get props => [resEpisodesModel];

  @override
  String tostring() => "{resEpisodesModel: $resEpisodesModel}";
}

class EpisodeInitial extends EpisodeState {}
