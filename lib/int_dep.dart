import 'package:anime_wave/features/anime/data/datasources/RemoteDataSources.dart';
import 'package:anime_wave/features/anime/data/repository/anime_repostory_imp.dart';
import 'package:anime_wave/features/anime/domin/repository/anime_repository.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_category_anime.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_new_episode.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_promos_usecase.dart';
import 'package:anime_wave/features/anime/domin/usecases/get_top_airing_usecase.dart';
import 'package:anime_wave/features/anime/presentation/bloc/animebloc/anime_bloc.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:anime_wave/features/animeInfo/data/datasource/anime_info_remote_data_source.dart';
import 'package:anime_wave/features/animeInfo/data/datasource/supabase_anime_info_remote_data_source.dart';
import 'package:anime_wave/features/animeInfo/data/repository/supabase_info_repository_imp.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_anime_info_usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_my_anime_info_usecase.dart';
import 'package:anime_wave/features/animeInfo/domin/usecase/get_watch_servers_usecase.dart';
import 'package:anime_wave/features/animeInfo/presentation/bloc/anime_info_bloc.dart';
import 'package:anime_wave/features/animeInfo/presentation/bloc/cubit/episode_servers_cubit.dart';
import 'package:anime_wave/features/animeSearch/data/datasources/search_remote_datasource.dart';
import 'package:anime_wave/features/animeSearch/data/repository/anime_search_repository_imp.dart';
import 'package:anime_wave/features/animeSearch/domin/usecases/get_anime_search_usecase.dart';
import 'package:anime_wave/features/animeSearch/presentation/bloc/search_bloc.dart';
import 'package:anime_wave/features/favoriteList/data/datasources/favorite_remote_database.dart';
import 'package:anime_wave/features/favoriteList/data/repository/favorite_list_repository_imp.dart';
import 'package:anime_wave/features/favoriteList/domin/usecase/get_favorite_list_usecase.dart';
import 'package:anime_wave/features/favoriteList/presentation/bloc/favorite_bloc.dart';
import 'package:anime_wave/features/profile/data/datasource/profile_datesource.dart';
import 'package:anime_wave/features/profile/data/repository/profile_repository_imp.dart';
import 'package:anime_wave/features/profile/domin/usecase/get_profile_usecase.dart';
import 'package:anime_wave/features/profile/domin/usecase/logout_usecase.dart';
import 'package:anime_wave/features/profile/domin/usecase/update_user_usecase.dart';
import 'package:anime_wave/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/cubit/app_user/app_user_cubit.dart';
import 'core/secrets/app_secret.dart';
import 'core/utils/internet_checker.dart';
import 'features/anime/domin/usecases/get_category_usecase.dart';
import 'features/animeInfo/data/repository/anime_info_repository_imp.dart';
import 'features/animeInfo/domin/repository/anime_info_repository.dart';
import 'features/animeInfo/domin/repository/supabase_info_repository.dart';
import 'features/animeInfo/domin/usecase/insert_my_anime_info_usecase.dart';
import 'features/animeInfo/domin/usecase/update_my_anime_info_usecase.dart';
import 'features/animeInfo/presentation/bloc/my_anime_info_cubit/myanimeinfo_cubit.dart';
import 'features/animeSearch/domin/repository/anime_search_repository.dart';
import 'features/auth/data/datasources/auth_remote_data_sourse.dart';
import 'features/auth/data/repository/auth_repository_imp.dart';
import 'features/auth/domin/repository/auth_repository.dart';
import 'features/auth/domin/usecases/current_user_usecase.dart';
import 'features/auth/domin/usecases/user_login_usecase.dart';
import 'features/auth/domin/usecases/user_sign_up.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/favoriteList/domin/repository/favorite_list_repository.dart';
import 'features/profile/domin/repository/profile_repository.dart';
import 'features/profile/domin/usecase/upload_image_usecase.dart';

final serviceLocator =GetIt.instance;
Future<void> intDependcies() async{
  final dio=Dio();
  final supabase=await Supabase.initialize(
    url: AppSecret.ProjectURL,
    anonKey: AppSecret.AnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerFactory(() => InternetConnection());
  serviceLocator.registerFactory<ConnectionChecker>(() => ConnectionCheckerImp(serviceLocator()));


  _intAnimeSection();
  serviceLocator.registerLazySingleton(() => dio);
}
void _intAnimeSection(){
  _intAnime();
  _intAnimeInfo();
  _intAnimeSearch();
  _intAuth();
  _intFavoriteList();
  _intProfile();


}
void _intAuth(){
  serviceLocator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImp(serviceLocator(),serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserLoginUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => CurrentUserUsecase(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator(), userLoginUsecase: serviceLocator(), current_user_usecase: serviceLocator(), appUserCubit: serviceLocator()));



}

void _intAnime(){
  serviceLocator.registerFactory<RemoteDataSources>(() => RemoteDataSourcesImp(serviceLocator()));
  serviceLocator.registerFactory<AnimeRepository>(() => AnimeRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetNewEpisodeUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => GetTopAiringUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => GetPromoUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => GetCategoryUsecase( animeRepository: serviceLocator(),));
  serviceLocator.registerFactory(() => GetCategoryAnimeUsecase( serviceLocator(),));



  serviceLocator.registerFactory(() => AnimeBloc(getNewEpisodeUsecase: serviceLocator(),
      getTopAiringUsecase: serviceLocator(), getPromoUsecase: serviceLocator(), getCategoryUsecase: serviceLocator()));

  serviceLocator.registerFactory(() => PaginationBloc(getNewEpisodeUsecase: serviceLocator(),
      getTopAiringUsecase: serviceLocator(), getCategoryAnimeUsecase: serviceLocator()));




}

void _intAnimeInfo(){
  serviceLocator.registerFactory<AnimeInfoRemoteDataSources>(() => AnimeInfoRemoteDataSourcesImp(serviceLocator()));
  serviceLocator.registerFactory<AnimeInfoRepository>(() => AnimeInfoRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetAnimeInfoUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => AnimeInfoBloc( getAnimeInfoUsecase: serviceLocator()));

  serviceLocator.registerFactory(() => GetWatchServersUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => EpisodeServersCubit(getWatchServersUsecase: serviceLocator() ));


  serviceLocator.registerFactory<SubabaseAnimeInfoDataSources>(() => SubabaseAnimeInfoDataSourcesImp(serviceLocator()));
  serviceLocator.registerFactory<SupabaseInfoRepository>(() => SupabaseInfoRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetMyAnimeInfoUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => InsertMyAnimeInfoUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UpdateMyAnimeInfoUsecase(serviceLocator()));


  serviceLocator.registerFactory(() => MyanimeinfoCubit(getMyAnimeInfoUsecase: serviceLocator(), insertMyAnimeInfoUsecase:  serviceLocator(), updateMyAnimeInfoUsecase: serviceLocator()));




}

void _intAnimeSearch(){
  serviceLocator.registerFactory<SearchRemoteDateSource>(() => SearchRemoteDataSourceImp(serviceLocator()));
  serviceLocator.registerFactory<AnimeSearchRepository>(() => AnimeSearchRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetAnimeSearchUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => SearchBloc( getAnimeSearchUsecase: serviceLocator()));




}

void _intFavoriteList(){
  serviceLocator.registerFactory<FavoriteListDataSources>(() => FavoriteListDataSourcesImp(serviceLocator()));
  serviceLocator.registerFactory<FavoriteListRepository>(() => FavoriteListRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetFavoriteListUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => FavoriteBloc( getFavoriteListUsecase: serviceLocator()));




}

void _intProfile(){
  serviceLocator.registerFactory<ProfileDatasource>(() => ProfileDatasourceImp(serviceLocator()));
  serviceLocator.registerFactory<ProfileRepository>(() => ProfileRepositoryImp(serviceLocator()));
  serviceLocator.registerFactory(() => GetProfileUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UploadImageUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UpdateUserUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => LogOutUsecase(serviceLocator()));


  serviceLocator.registerFactory(() => ProfileBloc(getProfileUsecase: serviceLocator(), appUserCubit: serviceLocator(), uploadImageUsecase: serviceLocator(), updateUserUsecase: serviceLocator(), logOutUsecase: serviceLocator()));




}


