import 'package:anime_wave/core/error/failures.dart';
import 'package:anime_wave/core/usecase/usecase.dart';
import 'package:anime_wave/features/anime/domin/entites/promo.dart';
import 'package:anime_wave/features/anime/domin/repository/anime_repository.dart';
import 'package:fpdart/src/either.dart';

class GetPromoUsecase implements Usecase<List<Promo>,NoParams>{
  final AnimeRepository animeRepository;

  GetPromoUsecase(this.animeRepository);

  @override
  Future<Either<Failures, List<Promo>>> call(NoParams params) async {
    return await animeRepository.GetPromos();
  }

}