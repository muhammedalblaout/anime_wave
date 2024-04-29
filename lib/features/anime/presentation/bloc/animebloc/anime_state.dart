part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}
final class AnimeFail extends AnimeState {
   final String massage;

   AnimeFail(this.massage);
}
final class AnimeSuccess extends AnimeState {
   final AnimeEpisodePage page;
   String state="";

   AnimeSuccess(this.page);
}

final class AnimeLoading extends AnimeState {}

//Episode state
final class NewEpisode extends AnimeSuccess {
  NewEpisode(super.page);

}
final class TopAiring extends AnimeSuccess {
   TopAiring(super.page);

}



//Promo state
final class PromoSuccess extends AnimeState{
   final List<Promo> promos;

   PromoSuccess(this.promos);
}

//category state

final class CategorySuccess extends AnimeState {
   final List<Category> list;

   CategorySuccess(this.list);
}






