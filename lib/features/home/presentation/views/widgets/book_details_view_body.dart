import 'package:flutter/material.dart';
import 'package:my_bookley/core/utils/styles.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/custom_book_item.dart';

import 'books_action.dart';
import 'custom_book_details_appbar.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(
            height: 37.0,
          ),
          const BooksAction(),
          const SizedBox(
            height: 30.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}
