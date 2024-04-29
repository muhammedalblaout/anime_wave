import 'package:anime_wave/core/error/failures.dart';

import 'package:anime_wave/features/animeSearch/domin/entites/anime_search_page_response.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../domin/repository/anime_search_repository.dart';
import '../datasources/search_remote_datasource.dart';

class AnimeSearchRepositoryImp implements AnimeSearchRepository{
  SearchRemoteDateSource SearchRemoteDataSource;

  AnimeSearchRepositoryImp(this.SearchRemoteDataSource);

  @override
  Future<Either<Failures, AnimeSearchPageResponse>> GetAnimeSearch(String query, String page) async {
    try {

      final response = await SearchRemoteDataSource.GetAnimeSearch(query==""?" ":query, page);
      return Right(response);
    }
    on ServerExcepiton catch(e){
      return Left(Failures(e.massage));
    }
  }
  }
