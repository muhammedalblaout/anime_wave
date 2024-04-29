import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/animeSearch/presentation/pages/anime_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/app_user/app_user_cubit.dart';
import '../../cubit/app_user/app_user_state.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late String avatar_url;

  @override
  void initState() {
    avatar_url =
        (context.read<AppUserCubit>().state as AppUserLoggin).user.avatarurl;

    print(avatar_url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: Row(
        children: [
          Text(
            "Anime Wave ",
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          SizedBox(
            width: 34,
            height: 34,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, AnimeSearchPage.route());
              },
              child: const Icon(
                Icons.search,
                color: AppPallete.color2,
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppPallete.color3),
                shape: MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          BlocBuilder<AppUserCubit, AppUserState>(
            builder: (context, state) {
              return Container(
                child: Image.network(
                    "${avatar_url}?${DateTime.now().millisecondsSinceEpoch.toString()}",
                    fit: BoxFit.cover),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(50) // Adjust the radius as needed
                    ),
                width: 34,
                height: 34,
              );
            },
          ),
        ],
      ),
    );
  }
}
