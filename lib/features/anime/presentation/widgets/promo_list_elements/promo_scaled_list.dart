import 'package:anime_wave/features/anime/presentation/bloc/animebloc/anime_bloc.dart';
import 'package:anime_wave/features/anime/presentation/widgets/promo_list_elements/promo_list_card.dart';
import 'package:anime_wave/features/anime/presentation/widgets/promo_list_elements/promo_list_card_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoScaledList extends StatefulWidget {
  const PromoScaledList({super.key});

  @override
  State<PromoScaledList> createState() => _PromoScaledListState();
}

class _PromoScaledListState extends State<PromoScaledList> {
  @override
  void initState() {
    context.read<AnimeBloc>().add(PromoEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        width: double.infinity,
        height: 118,
        child: BlocBuilder<AnimeBloc, AnimeState>(
          builder: (context, state) {
            if (state is PromoSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PromoListCard(promo: state.promos[index]);
                },
                itemCount: state.promos.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              );
            }
            if (state is AnimeLoading) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PromoListCardShimmer();
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
