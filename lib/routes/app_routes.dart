import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:signify_test/features/quotes/presentation/pages/home_page.dart';
import 'package:signify_test/features/quotes/presentation/pages/random_quote_page.dart';

import '../features/quotes/presentation/bloc/quote_bloc/quote_bloc.dart';
import '../features/quotes/presentation/bloc/quote_page/quote_page_bloc.dart';
import '../features/quotes/presentation/bloc/quotes_bloc/quotes_bloc.dart';
import '../service_locator.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<QuotesBloc>(
                create: (context) => getIt<QuotesBloc>(),
              ),
              BlocProvider<QuotePageBloc>(
                create: (context) => getIt<QuotePageBloc>(),
              ),
            ],
            child: const HomePage(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'random',
            path: 'random',
            builder: (BuildContext context, GoRouterState state) {
              return  BlocProvider<QuoteBloc>(
                create: (context) => getIt<QuoteBloc>(),
                child: const RandomQuotePage(),
              );
            },
          ),
        ],
      ),
    ],
  );
  static GoRouter get router => _router;
}
