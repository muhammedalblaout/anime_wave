import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/entites/my_anime_Info.dart';
import '../../domin/usecase/get_favorite_list_usecase.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  GetFavoriteListUsecase _getFavoriteListUsecase;

  FavoriteBloc({required GetFavoriteListUsecase getFavoriteListUsecase})
      : _getFavoriteListUsecase = getFavoriteListUsecase,
        super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {});

    on<getFavoriteListEvent>((event, emit) async {
      emit(FavoriteLoading());
      final res = await _getFavoriteListUsecase(FavoriteListParams(user_id: event.user_id));
      res.fold(
              (l) => emit(FavoriteFail(l.massage,)), (r) {
                emit(FavoriteSuccess(r));
      });
    });
  }
}
