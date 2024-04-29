part of 'anime_bloc.dart';

@immutable
sealed class AnimeEvent {
  final AnimeEventName animeEventName;

  AnimeEvent(this.animeEventName);
}


class NewEpisodeEvent extends AnimeEvent{
  final String pagenum;

   NewEpisodeEvent({
    required this.pagenum,
  }):super(AnimeEventName.NewEpisodeEvent);
}

class GetCategoryEvent extends AnimeEvent {
  GetCategoryEvent():super(AnimeEventName.GetCategoryEvent);

}


class TopEpisodeEvent extends AnimeEvent{
  final String pagenum;

   TopEpisodeEvent({
    required this.pagenum,
  }):super(AnimeEventName.TopEpisodeEvent);
}



class PromoEvent extends AnimeEvent{
  PromoEvent():super(AnimeEventName.AnimePromo);

}
