import 'package:anime_wave/core/commen/widgets/loader.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../animeInfo/presentation/page/anime_info_page.dart';
import '../widgets/details_list_page/details_list_page_card.dart';

class DetailsListPage extends StatefulWidget {

  final String header;
  final PaginationEvent paginationEvent;

  const DetailsListPage(
      {super.key, required this.header, required this.paginationEvent});

  @override
  State<DetailsListPage> createState() => _DetailsListPageState();
}

class _DetailsListPageState extends State<DetailsListPage> {
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

          return ListView.builder(
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
              itemBuilder: (context, index) {
                if (index == Episode.length) {
                  return Loader(color: AppPallete.color1);
                }

                return GestureDetector(
                  child: DetailsListPageCard(
                    animeEpisode: Episode[index],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,AnimeInfoPage.route(Episode[index].id)
                    );
                  },
                );
              },
              itemCount: Episode.length + (isLoading ? 1 : 0));
        }));
  }
}
