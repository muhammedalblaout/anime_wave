import 'package:anime_wave/features/animeSearch/domin/entites/anime_search.dart';
import 'package:anime_wave/features/animeSearch/domin/usecases/get_anime_search_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  int page = 1;
  bool hasNexPage=true;
  late String Query;
  GetAnimeSearchUsecase _getAnimeSearchUsecase;

  SearchBloc({required GetAnimeSearchUsecase getAnimeSearchUsecase})
      : _getAnimeSearchUsecase = getAnimeSearchUsecase,
        super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});


    on<SearchChaneg>((event, emit) async {
      emit(SearchLoading());

      page=1;
      final res= await _getAnimeSearchUsecase(SearchParams(Query: event.Query, Page: page.toString()));
      res.fold((l) => emit(SearchFaill(l.massage)), (r) {
        Query=event.Query;
        hasNexPage=r.hasNextPage;
        print(r.results[0].title);
        emit(SearchLoad(r.results,r.hasNextPage));
      } );

    });

    on<LoadmoreEvent>((event, emit) async {
      if(state is SearchLoadingMore) return;
      if(!hasNexPage)return;

      final currentState= state;
      var oldAnimeSearch=<AnimeSearch>[];
      if(currentState is SearchLoad){
        oldAnimeSearch=currentState.list;

      }

      emit(SearchLoadingMore(oldAnimeSearch));
      page=page+1;

      final res= await _getAnimeSearchUsecase(SearchParams(Query: Query, Page: page.toString()));
      res.fold((l) => emit(SearchFaill(l.massage)), (r) {
        hasNexPage=r.hasNextPage;


        final list= (state as SearchLoadingMore).oldlist;

        list.addAll(r.results);
        emit(SearchLoad(list,r.hasNextPage));
      } );

    });


  }


}
