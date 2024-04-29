part of 'anime_info_bloc.dart';


abstract  class AnimeInfoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAnimeInfoEvent extends AnimeInfoEvent {
  final String id;

  GetAnimeInfoEvent({required this.id});
  final newTimestamp = DateTime.now().millisecondsSinceEpoch;

  List<Object> get props => [id,newTimestamp];
}

class SortEpisodeEvent extends AnimeInfoEvent{

  SortEpisodeEvent();

}
