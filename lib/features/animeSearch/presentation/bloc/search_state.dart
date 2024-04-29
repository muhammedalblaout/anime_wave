part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoad extends SearchState {
  bool hasNext;
  List<AnimeSearch> list;

  SearchLoad(this.list,this.hasNext);


}
final class SearchFaill extends SearchState {
  final String massage;

  SearchFaill(this.massage);
}
final class SearchLoading extends SearchState {}

final class SearchLoadingMore extends SearchState {
  List<AnimeSearch> oldlist;

  SearchLoadingMore(this.oldlist);
}


