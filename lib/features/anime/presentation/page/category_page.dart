
import 'package:anime_wave/core/commen/widgets/home_header.dart';
import 'package:anime_wave/features/anime/presentation/bloc/animebloc/anime_bloc.dart';
import 'package:anime_wave/features/anime/presentation/widgets/category_page_elements/catagory_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    context.read<AnimeBloc>().add(GetCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          HomeHeader(),
          Expanded(child: Container(
            child: BlocBuilder<AnimeBloc, AnimeState>(
              builder: (context, state) {
                if (state is CategorySuccess) {
                  return GridView.builder(
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
                    state.list.length,
                    // total number of items
                    itemBuilder: (context, index) {
                      return CategoryCard(category:state.list[index], index:index%5);
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ))
        ],
      ),
    ));
  }
}
