import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/anime/domin/entites/category.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_category_usecase.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_promos_usecase.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_top_airing_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domin/entites/anime_episode_page.dart';
import '../../../domin/entites/promo.dart';
import '../../../domin/usecases/get_new_episode.dart';
import '../enums.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetNewEpisodeUsecase _getNewEpisodeUsecase;
  final GetTopAiringUsecase _getTopAiringUsecase;
  final GetPromoUsecase _getPromoUsecase;
  final GetCategoryUsecase _getCategoryUsecase;



  AnimeBloc({required GetNewEpisodeUsecase getNewEpisodeUsecase,
    required GetTopAiringUsecase getTopAiringUsecase,
    required GetPromoUsecase getPromoUsecase,
    required GetCategoryUsecase getCategoryUsecase


  }) :
        _getNewEpisodeUsecase=getNewEpisodeUsecase,
        _getTopAiringUsecase=getTopAiringUsecase,
        _getPromoUsecase=getPromoUsecase,
        _getCategoryUsecase=getCategoryUsecase,


      super(AnimeInitial()) {
    on<AnimeEvent>((_, emit) {
      emit(AnimeLoading());
    });
    on<NewEpisodeEvent>((event, emit) async {
      final res= await _getNewEpisodeUsecase(PageParams(pagenum:event.pagenum ));
      res.fold((l) => emit(AnimeFail(l.massage)), (r) => emit(NewEpisode(r)));
    });
    on<TopEpisodeEvent>((event, emit) async {
      final res= await _getTopAiringUsecase(PageParams(pagenum: event.pagenum));
      res.fold((l) => emit(AnimeFail(l.massage)), (r) => emit(TopAiring(r)));
    });

    on<PromoEvent>((event, emit) async {
      final res= await _getPromoUsecase(NoParams());
      res.fold((l) => emit(AnimeFail(l.massage)), (r) => emit(PromoSuccess(r)));
    });

    on<GetCategoryEvent>((event, emit)async {
      final res=await _getCategoryUsecase(NoParams());
      res.fold((l) => emit(AnimeFail(l.massage)), (r) => emit(CategorySuccess(r)));

    });


  }
}
