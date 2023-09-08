import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookley/core/widgets/custom_error_widget.dart';
import 'package:my_bookley/core/widgets/custom_loading_indicator.dart';
import 'package:my_bookley/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomBookImage(
                      imgURL: state.books[index].volumeInfo!.imageLinks != null
                          ? state.books[index].volumeInfo!.imageLinks!.thumbnail
                              .toString()
                          : 'https://i5.walmartimages.com/asr/55e17340-d579-4e0a-b0e4-988f4bbe9494.0bfe8218098546df097c973bce5dc538.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF',
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
