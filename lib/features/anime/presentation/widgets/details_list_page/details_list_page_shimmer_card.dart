import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class DetailsListPageShimmerCard extends StatefulWidget {

  const DetailsListPageShimmerCard();

  @override
  State<DetailsListPageShimmerCard> createState() => _details_list_page_CardState();
}

class _details_list_page_CardState extends State<DetailsListPageShimmerCard> {

  @override
  Widget build(BuildContext context) {
    return Container(height:180,
      margin:EdgeInsets.symmetric(vertical:10,horizontal: 20),
      width:380,
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:AppPallete.grard3,
          boxShadow: const [BoxShadow(blurRadius:2.0,blurStyle: BlurStyle.normal,color: AppPallete.dropsShadow)]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 105,
              height: 150,
              clipBehavior: Clip.antiAlias,
              decoration:  BoxDecoration(
                  color: AppPallete.grard3_light.withOpacity(0.5),

                  borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
              ),

            ),
            SizedBox(width:16,),
            Container(
              width: 200,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Container(
                  width: 100,
                  height: 15,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      color:  AppPallete.grard3_light.withOpacity(0.5),

                      borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                  ),

                ),
                const SizedBox(height:6,)
                ,Container(
                  width: 50,
                  height: 15,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      color:  AppPallete.grard3_light.withOpacity(0.5),

                      borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                  ),
            ),
                const SizedBox(height:30,),
              Container(
                width: 100,
                height: 15,
                clipBehavior: Clip.antiAlias,
                decoration:  BoxDecoration(
                    color:  AppPallete.grard3_light.withOpacity(0.5),

                    borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                ),




              )],),
            )
          ],
        ),
      ),
    );
  }
}
