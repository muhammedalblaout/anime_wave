part of 'pagination_bloc.dart';

@immutable
sealed class PaginationEvent {}
class GetNewAnimePaginationEvent extends PaginationEvent{

}

class GetTopanimePaginationEvent extends PaginationEvent{

}

class GetCategoryPaginationEvent extends PaginationEvent{
  final String category;

  GetCategoryPaginationEvent(this.category);
}