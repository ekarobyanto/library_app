import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/src/features/auth/auth_screen.dart';
import 'package:library_app/src/features/book/domain/book.dart';
import 'package:library_app/src/features/book/presentation/book_category_list/book_category_list.dart';
import 'package:library_app/src/features/book/presentation/book_list/book_list.dart';
import 'package:library_app/src/features/book/presentation/book_screen/book_screen.dart';
import 'package:library_app/src/features/book/presentation/upload_book/book_form.dart';
import 'package:library_app/src/features/common/presentation/pdf_screen.dart';
import 'package:library_app/src/features/community/chat_screen.dart';
import 'package:library_app/src/features/community/com_chat_screen.dart';
import 'package:library_app/src/features/community/user_chat_screen.dart';
import 'package:library_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:library_app/src/features/library/presentation/library_screen.dart';
import 'package:library_app/src/features/library/presentation/search/cubit/book_search_cubit.dart';
import 'package:library_app/src/features/library/presentation/search/library_search.dart';
import 'package:library_app/src/features/main_scaffold.dart';
import 'package:library_app/src/features/report/presentation/create_report.dart';
import 'package:library_app/src/features/report/presentation/report_detail.dart';
import 'package:library_app/src/features/report/presentation/report_screen.dart';
import 'package:library_app/src/features/user/presentation/user_screen.dart';
import 'package:library_app/src/splash_screen.dart';
import 'package:library_app/src/utils/create_go_route_instance.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    createGoRouteInstance(
      route: '/',
      screen: const SplashScreen(),
    ),
    createGoRouteInstance(
      route: '/auth',
      navigatorKey: _rootNavigatorKey,
      screen: AuthScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        createGoRouteInstance(
          route: '/dashboard',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),
        createGoRouteInstance(
          route: '/social',
          pageBuilder: (_, __) => const NoTransitionPage(
            child: ChatScreen(),
          ),
        ),
        createGoRouteInstance(
          route: '/report',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ReportScreen(),
          ),
          routes: [
            createGoRouteInstance(
              route: ':id',
              navigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ReportDetail(
                  reportId: state.pathParameters['id']!,
                ),
              ),
            ),
          ],
        ),
        createGoRouteInstance(
          route: '/profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: UserScreen(),
          ),
        ),
      ],
    ),
    createGoRouteInstance(
      route: '/chat-room/:id',
      navigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => NoTransitionPage(
        child: UserChatScreen(
          chatRoomId: state.pathParameters['id']!,
          receiverName: state.extra as String,
        ),
      ),
    ),
    createGoRouteInstance(
      route: '/library',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LibraryScreen(),
      ),
      routes: [
        createGoRouteInstance(
          route: 'search-books',
          routeName: 'search-books',
          pageBuilder: (context, state) => NoTransitionPage(
            child: BlocProvider(
              create: (context) => BookSearchCubit(
                bookRepository: context.read(),
              ),
              child: const LibrarySearchScreen(),
            ),
          ),
        ),
        createGoRouteInstance(
          route: 'book-category',
          routeName: 'book-category',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: BookCategoryList(),
          ),
        ),
      ],
    ),
    createGoRouteInstance(
      route: '/book/:id',
      pageBuilder: (context, state) => MaterialPage(
        child: BookScreen(bookId: state.pathParameters['id']!),
      ),
    ),
    createGoRouteInstance(
      route: '/create-book',
      pageBuilder: (context, state) => MaterialPage(
        child: BookForm(
          book: state.extra as Book?,
        ),
      ),
    ),
    createGoRouteInstance(
      route: '/create-report',
      screen: const CreateReport(),
    ),
    createGoRouteInstance(
      route: '/book-list',
      pageBuilder: (context, state) {
        final parameters = state.extra as Map<String, dynamic>;
        return MaterialPage(
          child: BookList(
            title: parameters['title']!,
            url: parameters['url']!,
          ),
        );
      },
    ),
    createGoRouteInstance(
      route: '/pdf/:title',
      pageBuilder: (context, state) => MaterialPage(
        child: PdfScreen(
          url: state.extra as String,
          title: state.pathParameters['title']!,
        ),
      ),
    ),
    createGoRouteInstance(
      route: '/community-chat',
      screen: const CommunityChatScreen(),
    ),
  ],
);
