import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/anime/domin/entites/category.dart';

import 'package:fpdart/src/either.dart';

import '../repository/anime_repository.dart';

class GetCategoryUsecase implements Usecase<List<Category>,NoParams>{
  AnimeRepository animeRepository;

  GetCategoryUsecase({
    required this.animeRepository,
  });

  @override
  Future<Either<Failures, List<Category>>> call(NoParams params)async {
    return  await animeRepository.getCategory();
  }


}