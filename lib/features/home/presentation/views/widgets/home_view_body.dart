import 'package:flutter/material.dart';
import 'package:my_bookley/core/utils/assets.dart';
import 'package:my_bookley/core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 50,
          ),
          Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
          BestSellerListItem(),
        ],
      ),
    );
  }
}

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [AspectRatio(
          aspectRatio: 2.5 / 4,
          child: Container(
            //height:  MediaQuery.of(context).size.height * .3,
            //width: MediaQuery.of(context).size.width * .25,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.testImage),
                )),
          ),
        ),
        const Column(

        )],
      ),
    );
  }
}

