import 'package:anime_wave/features/anime/presentation/widgets/scroll_view_elements/home_page_scroll_view.dart';
import 'package:anime_wave/core/commen/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../int_dep.dart';
import '../bloc/animebloc/anime_bloc.dart';
import '../widgets/promo_list_elements/promo_scaled_list.dart';
import 'details_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox( height:10),
              BlocProvider(
                create: (context) => serviceLocator<AnimeBloc>(),
                child: PromoScaledList(),
              ),
              const SizedBox(height: 16,),
              BlocProvider(
                create: (context) => serviceLocator<AnimeBloc>(),
                child: HomeScrollView(
                  head: "New Episode: ", animeEvent: NewEpisodeEvent(pagenum: '1'),),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AnimeBloc>(),
                child: HomeScrollView(
                  head: "Top Airing: ", animeEvent: TopEpisodeEvent(pagenum: '1'),),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
