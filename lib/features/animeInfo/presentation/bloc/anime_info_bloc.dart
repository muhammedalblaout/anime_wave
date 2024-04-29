import 'package:anime_wave/features/animeInfo/domin/entites/anime_info.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_anime_info_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'anime_info_event.dart';

part 'anime_info_state.dart';

class AnimeInfoBloc extends Bloc<AnimeInfoEvent, AnimeInfoState> {
  final GetAnimeInfoUsecase _getAnimeInfoUsecase;

  AnimeInfoBloc({
    required GetAnimeInfoUsecase getAnimeInfoUsecase,
  })  : _getAnimeInfoUsecase = getAnimeInfoUsecase,
        super(AnimeInfoInitial()) {
    on<AnimeInfoEvent>((_, emit) {
    });
    on<GetAnimeInfoEvent>((event, emit) async {
      final res = await _getAnimeInfoUsecase(InfoParams(id: event.id));
      res.fold(
          (l) => emit(AnimeInfoFaill(
                massage: l.massage,
              )),
          (r) => emit(AnimeInfoSuccess(animeInfo: r)));
    });

    on<SortEpisodeEvent>((event, emit)  {
      var animeInfo=(state as AnimeInfoSuccess).animeInfo;
      print(animeInfo.episodes[0].number.toString());
      var list=animeInfo.episodes.reversed.toList();
      print(list[0].number.toString());
      animeInfo=animeInfo.copyWith(episodes: list);
      emit(AnimeInfoSuccess(animeInfo: animeInfo));




    });
  }
}
