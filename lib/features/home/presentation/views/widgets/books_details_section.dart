import 'package:flutter/material.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/books_action.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/custom_book_item.dart';

import '../../../../../core/utils/styles.dart';


class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          height: 20.0,
        ),
        const BooksAction(),
      ],
    );
  }
}