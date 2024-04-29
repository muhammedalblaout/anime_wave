import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/entites/my_anime_Info.dart';
import '../repository/supabase_info_repository.dart';

class InsertMyAnimeInfoUsecase implements Usecase<MyAnimeInfo,InsertAnimeInfoParams>{
SupabaseInfoRepository subabaseInfoRepository;

InsertMyAnimeInfoUsecase(this.subabaseInfoRepository);

@override
Future<Either<Failures,MyAnimeInfo>> call(InsertAnimeInfoParams params) async {
return await subabaseInfoRepository.insertMyAnimeInfo(params.myAnimeInfo);
}

}

class InsertAnimeInfoParams{
  final MyAnimeInfo myAnimeInfo;

  InsertAnimeInfoParams({
    required this.myAnimeInfo,
  });
}