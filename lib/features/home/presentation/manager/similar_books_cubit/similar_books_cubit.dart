import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookley/features/home/data/repos/home_repo.dart';

import '../../../data/models/book_model/BookModel.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
          (failure) => {
        emit(
          SimilarBooksFailure(failure.errMessage),
        ),
      },
          (books) => {
        emit(
          SimilarBooksSuccess(books),
        ),
      },
    );
  }
}
