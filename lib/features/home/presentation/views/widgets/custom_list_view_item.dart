import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';


class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        //height:  MediaQuery.of(context).size.height * .3,
        //width: MediaQuery.of(context).size.width * .25,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AssetsData.testImage),
            )),
      ),
    );
  }
}
