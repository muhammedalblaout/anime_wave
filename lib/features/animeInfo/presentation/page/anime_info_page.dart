import 'package:anime_wave/core/commen/widgets/background.dart';
import 'package:anime_wave/core/commen/widgets/loader.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/core/entites/my_anime_Info.dart';
import 'package:anime_wave/features/animeInfo/presentation/bloc/anime_info_bloc.dart';
import 'package:anime_wave/features/animeInfo/presentation/bloc/my_anime_info_cubit/myanimeinfo_cubit.dart';
import 'package:anime_wave/features/animeInfo/presentation/widget/anime_info_widget.dart';
import 'package:anime_wave/features/animeInfo/presentation/widget/button_header.dart';
import 'package:anime_wave/features/animeInfo/presentation/widget/episode_grid_card.dart';
import 'package:anime_wave/features/animeInfo/presentation/widget/show_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'dart:math' as math;
import '../../../../core/cubit/app_user/app_user_cubit.dart';
import '../../../../core/cubit/app_user/app_user_state.dart';
import '../../../../int_dep.dart';
import '../bloc/cubit/episode_servers_cubit.dart';
class AnimeInfoPage extends StatefulWidget {
  static route(String id) => MaterialPageRoute(builder: (context) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => serviceLocator<AnimeInfoBloc>()),
              BlocProvider(
                  create: (_) => serviceLocator<EpisodeServersCubit>()),
              BlocProvider(create: (_) => serviceLocator<MyanimeinfoCubit>()),
            ],
            child: AnimeInfoPage(
              id: id,
            ));
      });

  final String id;

  const AnimeInfoPage({super.key, required this.id});

  @override
  State<AnimeInfoPage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimeInfoPage> {
  bool isfavorite = false;
  int last_episode = -1;
  bool isFirstTime = true;
  String user_id = "";

  @override
  void initState() {
    user_id = (context.read<AppUserCubit>().state as AppUserLoggin)
        .user
        .id
        .toString();
    context.read<MyanimeinfoCubit>().getMyAnimeInfo(user_id, widget.id);

    print(user_id);
    context.read<AnimeInfoBloc>().add(GetAnimeInfoEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MyanimeinfoCubit, MyanimeinfoState>(
      builder: (context, myinfostate) {
        if (myinfostate is MyanimeinfoSuccess) {
          isFirstTime = false;
          isfavorite = myinfostate.myAnimeInfo.isFaverite;
          last_episode = myinfostate.myAnimeInfo.last;
        }
        if (myinfostate is MyanimeinfoFail) {
          print("hello from fail");

          print(myinfostate.massage);
        }
        if (myinfostate is MyanimeinfoEmpty) {
          isFirstTime = myinfostate.isEmpty;
        }

        return BlocConsumer<AnimeInfoBloc, AnimeInfoState>(
            builder: (context, state) {
              if (state is AnimeInfoLoading) {
                print("AnimeInfoLoading");

                return Center(child: Loader(color: AppPallete.color1));
              }
              if (state is AnimeInfoSuccess) {
                print("AnimeInfoSuccess");
                return Stack(
                  children: [
                    BackgroundFade(
                        AppPallete.backgroundColor, state.animeInfo.image),
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0).copyWith(top: 24),
                          child: Column(
                            children: [
                              ButtonHeader(
                                onTap: () {
                                  MyAnimeInfo myAnimeInfo = MyAnimeInfo(
                                      name:state.animeInfo.title ,

                                      isFaverite: !isfavorite,
                                      last: last_episode,
                                      User_id: user_id,
                                      Anime_id: state.animeInfo.id,
                                      Image: state.animeInfo.image);
                                  if (isFirstTime) {
                                    context
                                        .read<MyanimeinfoCubit>()
                                        .InserMyAnimeInfo(myAnimeInfo);
                                  } else {
                                    context
                                        .read<MyanimeinfoCubit>()
                                        .UpdateMyAnimeInfo(myAnimeInfo);
                                  }
                                },
                                isfavorite: isfavorite,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              AnimeInfoWidget(animeInfo: state.animeInfo),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    state.animeInfo.title,
                                    style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    state.animeInfo.otherName[0],
                                    style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color:
                                            AppPallete.color2.withOpacity(0.5)),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "Description",
                                    style: GoogleFonts.poppins().copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppPallete.color2),
                                  ),
                                  ReadMoreText(
                                    state.animeInfo.description == ""
                                        ? "No Description Available "
                                        : state.animeInfo.description,
                                    trimMode: TrimMode.Line,
                                    trimLines: 4,
                                    colorClickableText: AppPallete.color1,
                                    trimCollapsedText: 'Read more',
                                    trimExpandedText: 'Read less',
                                    moreStyle: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Episodes:",
                                        style: GoogleFonts.poppins().copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: AppPallete.color2),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<AnimeInfoBloc>()
                                                .add(SortEpisodeEvent());
                                          },
                                          style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.zero),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    AppPallete.transparent),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                          child: Transform.rotate(
                                            angle: 90 * math.pi / 180,
                                            child: Icon(
                                              Icons.compare_arrows_rounded,
                                              color: AppPallete.color2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Container(
                                      height: 250,
                                      width: double.infinity,
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: (20 / 8),

                                          crossAxisCount: 2,
                                          // number of items in each row
                                          mainAxisSpacing: 8.0,
                                          // spacing between rows
                                          crossAxisSpacing:
                                              8.0, // spacing between columns
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        // padding around the grid
                                        itemCount:
                                            state.animeInfo.episodes.length,
                                        // total number of items
                                        itemBuilder: (context, index) {
                                          return EpisodeGridCard(animeInfoEpisode: state.animeInfo.episodes[index] ,
                                            islastEpisode: state.animeInfo.episodes[index].number==last_episode ,
                                            onTap: () {
                                            MyAnimeInfo myAnimeInfo = MyAnimeInfo(
                                                 name:state.animeInfo.title ,
                                                isFaverite: isfavorite,
                                                last: state.animeInfo.episodes[index].number,
                                                User_id: user_id,
                                                Anime_id: state.animeInfo.id,
                                                Image: state.animeInfo.image);
                                            context.read<EpisodeServersCubit>().getServer(state.animeInfo.episodes[index].id);
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return BlocProvider.value(
                                                    value: BlocProvider.of<MyanimeinfoCubit>(context),
                                                    child: BlocProvider.value(
                                                      value: BlocProvider.of<EpisodeServersCubit>(context),
                                                      child: ShowDialog(
                                                        Head:
                                                        "${state.animeInfo.title} : ${state.animeInfo.episodes[index].number.toString()}",
                                                        myanimeInfo: myAnimeInfo,
                                                        isFirstTime: isFirstTime,
                                                      ),
                                                    ));
                                              },
                                            );
                                          }, );
                                        },
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return Center(child: Loader(color: AppPallete.color1));
            },
            listener: (context, event) {});
      },
    ));
  }
}
