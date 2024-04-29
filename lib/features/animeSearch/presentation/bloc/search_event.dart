part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}
class SearchChaneg extends SearchEvent{
  final String Query;

   SearchChaneg({
    required this.Query,
  });

}

class LoadmoreEvent extends SearchEvent{


}



