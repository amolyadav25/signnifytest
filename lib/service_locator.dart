import 'package:flutter/material.dart';
import 'package:signify_test/features/quotes/presentation/bloc/quote_page_bloc.dart';

import 'core/network/api_client.dart';
import 'core/network/connectivity_util.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/quotes/data/datasource/quotable_api_data_source.dart';
import 'features/quotes/data/datasource/quote_local_data_source.dart';
import 'features/quotes/data/repository/quote_repository_impl.dart';
import 'features/quotes/domain/usecase/get_quotes_use_case.dart';
import 'features/quotes/domain/usecase/get_random_quote_use_case.dart';
import 'features/quotes/presentation/bloc/quote_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton(ApiClient());
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(QuotableApiDataSource(getIt<ApiClient>()));
  getIt.registerSingleton(QuoteLocalDataSource());
  getIt.registerSingleton(ConnectivityUtil());
  getIt.registerSingleton(QuotableRepositoryImpl(
    getIt<QuotableApiDataSource>(),
    getIt<QuoteLocalDataSource>(),
    getIt<ConnectivityUtil>(),
    getIt<Dio>(),
  ));
  getIt.registerSingleton(GetRandomQuoteUseCase(getIt<QuotableRepositoryImpl>()));

  getIt.registerSingleton(GetQuotesUseCase(quoteRepository: getIt<QuotableRepositoryImpl>()));
  getIt.registerSingleton(QuoteBloc(
    getRandomQuoteUseCase: getIt<GetRandomQuoteUseCase>(),
    getQuotesUseCase: getIt<GetQuotesUseCase>(),
  ));
  getIt.registerSingleton(PageController());
  getIt.registerFactory(() => QuotePageBloc(pageController: getIt<PageController>()));
}