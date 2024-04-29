import 'package:anime_wave/core/commen/widgets/loader.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:anime_wave/features/anime/presentation/widgets/details_list_page/details_grid_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../int_dep.dart';
import '../../../animeInfo/presentation/page/anime_info_page.dart';

class DetailsGridListPage extends StatefulWidget {
  static route(String header, PaginationEvent paginationEvent) =>
      MaterialPageRoute(builder: (context) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => serviceLocator<PaginationBloc>()),
            ],
            child: DetailsGridListPage(
              header: header,
              paginationEvent: paginationEvent,
            ));
      });
  final String header;
  final PaginationEvent paginationEvent;

  const DetailsGridListPage(
      {super.key, required this.header, required this.paginationEvent});

  @override
  State<DetailsGridListPage> createState() => _DetailsListPageState();
}

class _DetailsListPageState extends State<DetailsGridListPage> {
  @override
  void initState() {
    this.context.read<PaginationBloc>().add(widget.paginationEvent);
    super.initState();
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.header,
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(
            builder: (context, state) {
          if (state is PaginationLoading && state.isFirstFetch) {
            return Loader(color: AppPallete.color1);
          }
          List<AnimeEpisode> Episode = [];
          bool isLoading = false;

          if (state is PaginationLoading) {
            Episode = state.oldEpisodes;
            isLoading = true;
          } else if (state is PaginationLoaded) {
            Episode = state.Episodes;
          }

          return GridView.builder(
            itemCount: Episode.length +
                (isLoading
                    ? Episode.length % 2 == 0
                        ? 2
                        : 1
                    : 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 260, // ** add this **
            ),
            itemBuilder: (BuildContext context, int index) {
              if (isLoading) {
                if (Episode.length % 2 == 0) {
                  if (index >= Episode.length) {
                    return Loader(color: AppPallete.color1);
                  }
                } else {
                  if (index == Episode.length) {
                    return Loader(color: AppPallete.color1);
                  }
                }
              }

              return GestureDetector(
                  child: DetailsGridListPageCard(animeEpisode: Episode[index])
                 , onTap: () {
                Navigator.push(
                    context,AnimeInfoPage.route(Episode[index].id)
                );
              },);
            },
            controller: scrollController
              ..addListener(() {
                if (scrollController.position.atEdge) {
                  if (scrollController.position.pixels != 0) {
                    this
                        .context
                        .read<PaginationBloc>()
                        .add(widget.paginationEvent);
                  }
                }
              }),
          );
        }));
  }
}
