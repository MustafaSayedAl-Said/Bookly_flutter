import 'package:flutter/material.dart';
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
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.17),
            child: const CustomBookImage(),
          ),
        ],
      ),
    );
  }
}

