import 'package:flutter/material.dart';
import 'package:my_bookley/core/utils/styles.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/custom_book_item.dart';

import 'custom_book_details_appbar.dart';

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
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 43.0,
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
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
