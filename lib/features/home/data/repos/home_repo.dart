import 'package:dartz/dartz.dart';
import 'package:my_bookley/core/errors/failures.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}
