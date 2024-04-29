import 'package:anime_wave/core/commen/widgets/loader.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/core/utils/show_snack_bar.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:anime_wave/features/favoriteList/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/cubit/app_user/app_user_cubit.dart';
import '../../../../core/cubit/app_user/app_user_state.dart';
import '../../../../int_dep.dart';
import '../../../animeInfo/presentation/page/anime_info_page.dart';
import '../widgets/favorite_list_page_card.dart';

class FavoriteListPage extends StatefulWidget {
  static route(String header, PaginationEvent paginationEvent) =>
      MaterialPageRoute(builder: (context) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => serviceLocator<FavoriteBloc>()),
            ],
            child: FavoriteListPage(
            ));
      });

  const FavoriteListPage(
      {super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  @override
  void initState() {
    String user_id = (context.read<AppUserCubit>().state as AppUserLoggin).user.id.toString();
    this.context.read<FavoriteBloc>().add(getFavoriteListEvent(user_id));
    super.initState();
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Favorite List",
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return Loader(color: AppPallete.color1);
              }
              if(state is FavoriteFail){
                ErrorShowSnackBar(context, state.massage);
              }
              if(state is FavoriteSuccess){
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: FavoriteListPageCard(
                         myAnimeInfo:state.list[index],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,AnimeInfoPage.route(state.list[index].Anime_id)
                          );
                        },
                      );
                    },
                    itemCount:state.list.length );
              }
              return SizedBox();
            }));
  }
}
