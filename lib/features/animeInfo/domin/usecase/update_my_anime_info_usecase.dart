import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/entites/my_anime_Info.dart';
import '../repository/supabase_info_repository.dart';

class UpdateMyAnimeInfoUsecase implements Usecase<MyAnimeInfo,UpdateAnimeInfoParams>{
SupabaseInfoRepository subabaseInfoRepository;

UpdateMyAnimeInfoUsecase(this.subabaseInfoRepository);

@override
Future<Either<Failures,MyAnimeInfo>> call(UpdateAnimeInfoParams params) async {
return await subabaseInfoRepository.updateMyAnimeInfo(params.myAnimeInfo);
}

}

class UpdateAnimeInfoParams{
  final MyAnimeInfo myAnimeInfo;

  UpdateAnimeInfoParams({
    required this.myAnimeInfo,
  });
}