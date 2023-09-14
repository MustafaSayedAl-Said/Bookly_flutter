import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookley/core/errors/failures.dart';
import 'package:my_bookley/core/utils/api_service.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';
import 'package:my_bookley/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:mystery');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
