part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavoriteSuccess extends FavoriteState {
  final List<MyAnimeInfo> list;

  FavoriteSuccess(this.list);
}
final class FavoriteFail extends FavoriteState {
  final String massage;

  FavoriteFail(this.massage);
}
