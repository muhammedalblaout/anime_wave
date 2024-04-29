import 'package:anime_wave/core/entites/my_anime_Info.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_my_anime_info_usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/insert_my_anime_info_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domin/usecase/update_my_anime_info_usecase.dart';

part 'myanimeinfo_state.dart';

class MyanimeinfoCubit extends Cubit<MyanimeinfoState> {
  GetMyAnimeInfoUsecase _getMyAnimeInfoUsecase;
  InsertMyAnimeInfoUsecase _insertMyAnimeInfoUsecase;
  UpdateMyAnimeInfoUsecase _updateMyAnimeInfoUsecase;


  MyanimeinfoCubit(
      {required GetMyAnimeInfoUsecase getMyAnimeInfoUsecase,
      required InsertMyAnimeInfoUsecase insertMyAnimeInfoUsecase,
      required UpdateMyAnimeInfoUsecase updateMyAnimeInfoUsecase})
      : _getMyAnimeInfoUsecase = getMyAnimeInfoUsecase,
        _insertMyAnimeInfoUsecase=insertMyAnimeInfoUsecase,
        _updateMyAnimeInfoUsecase=updateMyAnimeInfoUsecase,

        super(MyanimeinfoInitial());

  void getMyAnimeInfo(String user_id, String anime_id) async {
    final res = await _getMyAnimeInfoUsecase(
        AnimeInfoParams(user_id: user_id, anime_id: anime_id));
    res.fold(
        (l) => emit(MyanimeinfoFail(
              l.massage,
            )), (r) {
      r.fold((l) => emit(MyanimeinfoEmpty(l.isEmpty)),
          (info) => emit(MyanimeinfoSuccess(info)));
    });
  }

  void InserMyAnimeInfo(MyAnimeInfo myAnimeInfo) async {
    final res = await _insertMyAnimeInfoUsecase(InsertAnimeInfoParams(myAnimeInfo: myAnimeInfo));
    res.fold(
        (l) => emit(MyanimeinfoFail(
              l.massage,
            )), (r) {

      emit(MyanimeinfoSuccess(r));
    });
  }

  void UpdateMyAnimeInfo(MyAnimeInfo myAnimeInfo) async {
    final res = await _updateMyAnimeInfoUsecase(UpdateAnimeInfoParams(myAnimeInfo: myAnimeInfo));
    res.fold(
            (l) => emit(MyanimeinfoFail(
          l.massage,
        )), (r) {

      emit(MyanimeinfoSuccess(r));
    });
  }
}
