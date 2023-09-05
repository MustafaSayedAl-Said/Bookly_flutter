import 'package:dartz/dartz.dart';
import 'package:my_bookley/core/errors/failures.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';
import 'package:my_bookley/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
