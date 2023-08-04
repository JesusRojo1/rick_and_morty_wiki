part of 'episode_bloc.dart';

@immutable
abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();
}

class GetAllEpisodes extends EpisodeEvent {
  final dynamic resEpisodesModel;

  const GetAllEpisodes(this.resEpisodesModel);

  @override
  List<Object?> get props => [resEpisodesModel];
}
