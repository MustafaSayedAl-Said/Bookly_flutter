import 'package:go_router/go_router.dart';
import 'package:my_bookley/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookley/features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter
{
  static const kHomeView = '/homeView';
  static const kBookView = '/bookView';
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
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}