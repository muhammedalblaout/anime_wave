
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/core/utils/show_snack_bar.dart';
import 'package:anime_wave/features/anime/presentation/bloc/animebloc/anime_bloc.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:anime_wave/features/anime/presentation/widgets/scroll_view_elements/scroll_view_card.dart';
import 'package:anime_wave/features/anime/presentation/widgets/scroll_view_elements/scroll_view_card_shimmer.dart';
import 'package:anime_wave/features/animeInfo/presentation/page/anime_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/enums.dart';
import '../../page/details_grid_list_page.dart';
import '../../page/details_list_page.dart';

class HomeScrollView extends StatefulWidget {
  final String head;
  final AnimeEvent animeEvent;
  HomeScrollView({required this.head, required this.animeEvent,});

  @override
  State<HomeScrollView> createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
@override
  void initState() {
  context.read<AnimeBloc>().add(widget.animeEvent);


  super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(children: [
              Text(widget.head,style: GoogleFonts.poppins().copyWith(fontSize: 18,fontWeight: FontWeight.w600),),
              GestureDetector(child: Text("Details",style: GoogleFonts.poppins().copyWith(fontSize: 18
                  ,fontWeight: FontWeight.w600
              ,color: AppPallete.color1)),
                onTap:(){
                  switch (widget.animeEvent.animeEventName) {

                    case AnimeEventName.NewEpisodeEvent:
                      Navigator.push(context,DetailsGridListPage.route(widget.head,GetNewAnimePaginationEvent()));
                      break;
                    case AnimeEventName.TopEpisodeEvent:
                      Navigator.push(context,DetailsGridListPage.route(widget.head,GetTopanimePaginationEvent()));
                      break;
                    default:
                  }


                },
              ),

            ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
          ),
          SizedBox(height: 4),

          BlocConsumer<AnimeBloc,AnimeState>(
              builder: (context,state){
                if(state is AnimeLoading){
                  return Padding(
                    padding: const EdgeInsets.all(0).copyWith(left: 22),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      child: ListView.builder(itemCount:5,
                        itemBuilder: (context, index) {
                          return ScrollViewCardShimmer1();
                        },scrollDirection: Axis.horizontal,


                      ),
                    ),
                  );
                }

            if(state is AnimeSuccess ){
              return  Padding(
                  padding: const EdgeInsets.all(0).copyWith(left: 22),
                  child: Container( width: double.infinity,
                    height: 300,
                    child: ListView.builder(itemCount:state.page.results.length,
                      itemBuilder: (context, index) {
                      return GestureDetector(child: ScrollViewCard(episode: state.page.results[index]),
                      onTap: (){
                        Navigator.push(
                          context,AnimeInfoPage.route(state.page.results[index].id)
                        );
                        },
                      );
                      },scrollDirection: Axis.horizontal,


                    ),
                  ),
              );

            }
            return Container();
          }, listener: (context,state){
                if(state is AnimeFail){
                  ErrorShowSnackBar(context, state.massage);
                }
          })
        ],
      ),
    );
  }
}
