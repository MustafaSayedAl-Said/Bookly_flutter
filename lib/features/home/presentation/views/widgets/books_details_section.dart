import 'package:flutter/material.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/books_action.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/custom_book_item.dart';

import '../../../../../core/utils/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.25),
          child: CustomBookImage(
            imgURL: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          bookModel.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6.0,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo!.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo!.averageRating ?? 0,
          count: bookModel.volumeInfo!.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const BooksAction(),
      ],
    );
  }
}
