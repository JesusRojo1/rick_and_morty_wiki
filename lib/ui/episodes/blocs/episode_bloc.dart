import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_show/ui/episodes/models/episodes_model.dart';
import 'package:rick_and_morty_show/ui/episodes/providers/api_provider_episodes.dart';

part 'episode_event.dart';

part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  ApiProviderEpisodes apiProvider;
  late dynamic getData;

  EpisodeBloc({required this.apiProvider}) : super(EpisodeInitial()) {
    on<GetAllEpisodes>((event, emit) => emit(
      state.copyWith(resEpisodesModel: event.resEpisodesModel),
    ),);
  }

  Future getAllEpisodes() async {
    final dynamic resGetAllEpisodes =
    await apiProvider.getDataAllEpisodes();
    try {
      if (resGetAllEpisodes.statusCode == 200) {
        return resGetAllEpisodes;
      }
    } catch (error) {
      return resGetAllEpisodes.response.statusCode;
    }
  }
}
