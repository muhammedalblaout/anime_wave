import 'package:anime_wave/core/commen/widgets/VideoPlayerWidgets/video_player_custom.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/commen/widgets/loader.dart';
import '../../../../core/entites/my_anime_Info.dart';
import '../bloc/cubit/episode_servers_cubit.dart';
import '../bloc/my_anime_info_cubit/myanimeinfo_cubit.dart';

class ShowDialog extends StatefulWidget {
  final String Head;
  final MyAnimeInfo myanimeInfo;
  final bool isFirstTime;
  const ShowDialog({super.key, required this.Head, required this.myanimeInfo, required this.isFirstTime});

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeServersCubit,EpisodeServersState>
      (builder:(context,state){
      if(state is EpisodeServersSuccess){

        return SimpleDialog(children: [

          //head of dialog
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(widget.Head,style: GoogleFonts.poppins().copyWith(fontSize:16,
                  fontWeight: FontWeight.w200,
                color: AppPallete.color2
              )),
            ),
          ),
          SizedBox(height: 4,),


          //server list

          Column(children:state.watchEpisode.servers.map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 8),
            child: GestureDetector(
              child: Container(
                width:double.infinity,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15) ,
                    color: AppPallete.color1
                ), // color of grid items
                child:  Center(
                  child: Text("Watch Episode in ${e.quality}",
                    style: GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w100,color:AppPallete.color2),
                  ),
                ),
              ),
              onTap:(){;
                if (widget.isFirstTime) {
                  context
                      .read<MyanimeinfoCubit>()
                      .InserMyAnimeInfo(widget.myanimeInfo);
                }
                else{
                  context
                      .read<MyanimeinfoCubit>()
                      .UpdateMyAnimeInfo(widget.myanimeInfo);
                }

                print(e.url);
                Navigator.push(context, VideoPlayerCustom.route(e.url,widget.Head));
              },
            ),
          )).toList(),mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,),
        ],backgroundColor: AppPallete.backgroundColor.withOpacity(0.9),);
      }
      if(state is EpisodeServersloading){
        return Center(child:Loader(color: AppPallete.color1,));
      }
      return SizedBox();

    }
    );
  }
}
