import 'package:flutter/material.dart';

import 'package:my_bookley/features/home/presentation/views/widgets/similiar_books_section.dart';

import 'books_details_section.dart';
import 'custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 30.0,
                  ),
                ),
                SimilarBooksSection(),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
