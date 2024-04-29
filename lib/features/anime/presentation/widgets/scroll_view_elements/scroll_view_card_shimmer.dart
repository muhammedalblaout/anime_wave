import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';

class ScrollViewCardShimmer1 extends StatelessWidget {
  const ScrollViewCardShimmer1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(children: [
          Container(
              width: 134,
              height: 191,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppPallete.grard1)),
          SizedBox(
            height: 5,
          ),
          Container(
              width: 100,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppPallete.grard1

                  )),
        ]));
  }
}
