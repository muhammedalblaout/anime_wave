import 'package:anime_wave/features/animeInfo/domin/entites/watch_episode.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_watch_servers_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'episode_servers_state.dart';

class EpisodeServersCubit extends Cubit<EpisodeServersState> {
  GetWatchServersUsecase _getWatchServersUsecase;

  EpisodeServersCubit({required GetWatchServersUsecase getWatchServersUsecase})
      : _getWatchServersUsecase = getWatchServersUsecase,
        super(EpisodeServersInitial());

  void getServer(String id) async {
    emit(EpisodeServersloading());
    final res = await _getWatchServersUsecase(WatchParams(id: id));
    res.fold(
        (l) => emit(EpisodeServersFaill(
              massage: l.massage,
            )), (r) {
      print(r.Referer);
      return emit(EpisodeServersSuccess(watchEpisode: r));
    });
  }
}
