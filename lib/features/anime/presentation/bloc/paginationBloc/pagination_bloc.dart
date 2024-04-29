import 'package:anime_wave/features/anime/domin/usecases/get_category_anime.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_category_usecase.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_top_airing_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domin/entites/anime_episode.dart';
import '../../../domin/usecases/get_new_episode.dart';

part 'pagination_event.dart';

part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final GetNewEpisodeUsecase _getNewEpisodeUsecase;
  final GetTopAiringUsecase _getTopAiringUsecase;
  final GetCategoryAnimeUsecase _getCategoryAnimeUsecase;


  int page = 1;

  PaginationBloc(
      {required GetNewEpisodeUsecase getNewEpisodeUsecase,
      required GetTopAiringUsecase getTopAiringUsecase,
       required GetCategoryAnimeUsecase getCategoryAnimeUsecase,


      })
      : _getNewEpisodeUsecase = getNewEpisodeUsecase,
        _getTopAiringUsecase = getTopAiringUsecase,
        _getCategoryAnimeUsecase=getCategoryAnimeUsecase,

        super(PaginationInitial()) {
    on<PaginationEvent>((event, emit) {});
    on<GetNewAnimePaginationEvent>((event, emit) async {
      if (state is PaginationLoading) return;
      final currentState = state;
      var oldEpisode = <AnimeEpisode>[];
      if (currentState is PaginationLoaded) {
        oldEpisode = currentState.Episodes;
      }
      emit(PaginationLoading(oldEpisode, isFirstFetch: page == 1));
      final res =
          await _getNewEpisodeUsecase(PageParams(pagenum: page.toString()));
      res.fold((l) {
        print(l.massage);
        emit(PaginationFaill(l.massage));
      }, (r) {
        page = page + 1;
        final list = (state as PaginationLoading).oldEpisodes;

        list.addAll(r.results);

        emit(PaginationLoaded(list));
      });
      ;
    });

    on<GetTopanimePaginationEvent>((event, emit) async {
      if (state is PaginationLoading) return;
      final currentState = state;
      var oldEpisode = <AnimeEpisode>[];
      if (currentState is PaginationLoaded) {
        oldEpisode = currentState.Episodes;
      }
      emit(PaginationLoading(oldEpisode, isFirstFetch: page == 1));
      final res =
          await _getTopAiringUsecase(PageParams(pagenum: page.toString()));
      res.fold((l) {
        print(l.massage);
        emit(PaginationFaill(l.massage));
      }, (r) {
        page = page + 1;
        final list = (state as PaginationLoading).oldEpisodes;

        list.addAll(r.results);

        emit(PaginationLoaded(list));
      });
      ;
    });

    on<GetCategoryPaginationEvent>((event, emit) async {
      if (state is PaginationLoading) return;
      final currentState = state;
      var oldEpisode = <AnimeEpisode>[];
      if (currentState is PaginationLoaded) {
        oldEpisode = currentState.Episodes;
      }
      emit(PaginationLoading(oldEpisode, isFirstFetch: page == 1));
      final res =
          await _getCategoryAnimeUsecase(CategoryPageParams(page.toString(), event.category));
      res.fold((l) {
        print(l.massage);
        emit(PaginationFaill(l.massage));
      }, (r) {
        page = page + 1;
        final list = (state as PaginationLoading).oldEpisodes;

        list.addAll(r.results);

        emit(PaginationLoaded(list));
      });
      ;
    });
  }
}
