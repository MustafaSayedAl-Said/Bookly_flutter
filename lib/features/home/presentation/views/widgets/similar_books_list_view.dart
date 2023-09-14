import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookley/core/widgets/custom_error_widget.dart';
import 'package:my_bookley/core/widgets/custom_loading_indicator.dart';
import 'package:my_bookley/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

import 'custom_book_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
  builder: (context, state) {
    if (state is SimilarBooksSuccess) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomBookImage(imgURL: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1638425885i/16299.jpg',),
              );
            }),
      );
    }
    else if(state is SimilarBooksFailure){
      return CustomErrorWidget(errMessage: state.errMessage);
    }
    else{
      return const CustomLoadingIndicator();
    }
  },
);
  }
}
