import 'package:anime_wave/core/commen/widgets/loader.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/animeInfo/presentation/page/anime_info_page.dart';
import 'package:anime_wave/features/animeSearch/domin/entites/anime_search.dart';
import 'package:anime_wave/features/animeSearch/presentation/bloc/search_bloc.dart';
import 'package:anime_wave/features/animeSearch/presentation/widgets/search_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/debouncer.dart';
import '../../../../int_dep.dart';

class AnimeSearchPage extends StatefulWidget {
  const AnimeSearchPage({super.key});

  static route() => MaterialPageRoute(builder: (context) {
        return MultiBlocProvider(providers: [
          BlocProvider(create: (_) => serviceLocator<SearchBloc>()),
        ], child: AnimeSearchPage());
      });

  @override
  State<AnimeSearchPage> createState() => _AnimeSearchPageState();
}

class _AnimeSearchPageState extends State<AnimeSearchPage> {
  static _border() => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPallete.backgroundColor,
        ),
        borderRadius: BorderRadius.circular(30),
      );
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    List<AnimeSearch> resulte = [];
    bool isLoading = false;
    bool hasNext = false;

    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: SizedBox(
            height:50,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  fillColor: AppPallete.color3,
                  filled: true,
                  hintStyle: GoogleFonts.poppins().copyWith(),
                  contentPadding: const EdgeInsets.all(20),
                  border: _border(),
                  enabledBorder: _border(),
                  focusedBorder: _border(),
                ),
                keyboardType: TextInputType.text,
                style: GoogleFonts.poppins().copyWith(),
                onChanged: (String value) {
                  _debouncer.run(() {
                    context.read<SearchBloc>().add(SearchChaneg(Query: value));
                    //perform search here
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<SearchBloc, SearchState>(builder: (context, state) {
        if (state is SearchLoading) {
          return Loader(color: AppPallete.color1);
        }
        if (state is SearchLoad) {
          resulte = state.list;
          hasNext = state.hasNext;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            controller: scrollController
              ..addListener(() {
                if (scrollController.position.atEdge) {
                  if (scrollController.position.pixels != 0) {
                    this.context.read<SearchBloc>().add(LoadmoreEvent());
                  }
                }
              }),
            itemBuilder: (context, index) {
              if (index == resulte.length && hasNext) {
                return Loader(color: AppPallete.color1);
              }
              return GestureDetector(
                child: SearchCard(animeSearch: resulte[index]),
                onTap: () {
                  Navigator.push(context, AnimeInfoPage.route( resulte[index].id));
                },
              );
            },
            itemCount: resulte.length + (hasNext ? (isLoading ? 1 : 0) : 0),
          ),
        );
      }, listener: (context, state) {
        if (state is SearchLoadingMore) {
          isLoading = true;
        }
      }),
    );
  }
}
