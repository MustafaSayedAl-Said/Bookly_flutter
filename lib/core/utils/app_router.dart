import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookley/core/utils/service_locator.dart';
import 'package:my_bookley/features/home/data/models/book_model/BookModel.dart';
import 'package:my_bookley/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookley/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_bookley/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookley/features/home/presentation/views/home_view.dart';
import 'package:my_bookley/features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookView = '/bookView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                ),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
