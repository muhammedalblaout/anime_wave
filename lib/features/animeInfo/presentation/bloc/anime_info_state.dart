part of 'anime_info_bloc.dart';


abstract class AnimeInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AnimeInfoInitial extends AnimeInfoState {}
final class AnimeInfoLoading extends AnimeInfoState {
  final newTimestamp = DateTime.now().millisecondsSinceEpoch;


  List<Object> get props => [newTimestamp];
}

final class AnimeInfoSuccess extends AnimeInfoState {
  final AnimeInfo animeInfo;

   AnimeInfoSuccess({
    required this.animeInfo,
  });
  final newTimestamp = DateTime.now().millisecondsSinceEpoch;


  List<Object> get props => [animeInfo,newTimestamp];
}
final class AnimeInfoFaill extends AnimeInfoState {
  final String massage;

   AnimeInfoFaill({
    required this.massage,
  });
}




