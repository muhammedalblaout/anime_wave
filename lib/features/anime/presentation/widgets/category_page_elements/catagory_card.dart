import 'package:anime_wave/features/anime/domin/entites/category.dart';
import 'package:anime_wave/features/anime/presentation/bloc/paginationBloc/pagination_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/app_pallete.dart';
import '../../page/details_grid_list_page.dart';


class CategoryCard extends StatelessWidget {
  Category category;
  int index;

  CategoryCard({super.key, required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 20,
          height: 30,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPallete.color1,
            image: DecorationImage(
              image:AssetImage("assets/${index}.jpg"),
              fit:BoxFit.cover,
              colorFilter:ColorFilter.mode(AppPallete.color1, BlendMode.hardLight),
            )
          ),
          // color of grid items
          child: Center(
            child: Text(
              category.name,
              style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  shadows: [Shadow(blurRadius: 10,)],
                  color: AppPallete.color2),
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context,DetailsGridListPage.route(category.name,GetCategoryPaginationEvent(category.id)));

      },
    );
  }
}
