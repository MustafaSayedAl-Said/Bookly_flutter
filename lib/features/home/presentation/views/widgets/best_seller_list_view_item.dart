import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookley/core/utils/app_router.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';
import 'package:my_bookley/features/home/presentation/views/widgets/custom_book_item.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookView);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imgURL: bookModel.volumeInfo!.imageLinks != null
                  ? bookModel.volumeInfo!.imageLinks!.thumbnail.toString()
                  : 'https://i5.walmartimages.com/asr/55e17340-d579-4e0a-b0e4-988f4bbe9494.0bfe8218098546df097c973bce5dc538.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF',
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo!.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGtSectraFine),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(bookModel.volumeInfo!.authors![0].toString(),
                      style: Styles.textStyle14),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(rating: bookModel.volumeInfo!.averageRating ?? 0, count: bookModel.volumeInfo!.ratingsCount ?? 0,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
