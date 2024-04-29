part of 'pagination_bloc.dart';

@immutable
sealed class PaginationState {}

final class PaginationInitial extends PaginationState {}

final class PaginationLoaded extends PaginationState {
  final List<AnimeEpisode> Episodes;

  PaginationLoaded(this.Episodes);
}
final class PaginationLoading extends PaginationState {
  final List<AnimeEpisode> oldEpisodes;
  final bool isFirstFetch ;

  PaginationLoading(this.oldEpisodes, {this.isFirstFetch=false});
}

final class PaginationFaill extends PaginationState {
  final String massage;

  PaginationFaill(this.massage);
}