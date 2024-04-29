part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}
class getFavoriteListEvent extends FavoriteEvent{
  final String user_id;

  getFavoriteListEvent(this.user_id);
}