import 'package:flutter/cupertino.dart';

import '../../../../core/network/connectivity_util.dart';
import '../../domain/entity/quote_entity.dart';
import '../../domain/repository/quote_repository.dart';
import '../datasource/quotable_api_data_source.dart';
import '../datasource/quote_local_data_source.dart';
import '../model/quote_model.dart';
import 'package:dio/dio.dart';

class QuotableRepositoryImpl implements QuoteRepository {
  final QuotableApiDataSource _remoteDataSource;
  final QuoteLocalDataSource localDataSource;
  final ConnectivityUtil connectivityUtil;
  final Dio dio;

  QuotableRepositoryImpl(
    this._remoteDataSource,
    this.localDataSource,
    this.connectivityUtil,
    this.dio,
  );

  @override
  Future<QuoteEntity> getRandomQuote() async {
    try {
      final isConnected = await connectivityUtil.isConnected();
      if (isConnected) {
        final apiResponse = await _remoteDataSource.getRandomQuote();
        final quoteModel = QuoteModel.fromJson(apiResponse);
        final quoteEntity = quoteModel.toEntity();
        await localDataSource.saveQuote(quoteEntity);
        return quoteEntity;
      } else {
        return getLocalQuote();
      }
    } catch (e) {
      debugPrint('$e');
      return getLocalQuote();
    }
  }

  @override
  Future<QuoteEntity> getLocalQuote() async {
    final localQuotes = localDataSource.getAllQuotes();
    return localQuotes.isNotEmpty
        ? localQuotes.first
        : QuoteEntity(
            id: "7CqA_-kKZKKF",
            content:
                "You don't choose your family. They are God's gift to you, as you are to them.",
            author: "Desmond Tutu",
            tags: ["Famous Quotes"],
            authorSlug: "desmond-tutu",
            length: 77,
            dateAdded: "2020-01-12",
            dateModified: "2023-04-14");
  }

  @override
  Future<List<QuoteEntity>> getQuotes() async {
    try {
      final isConnected = await connectivityUtil.isConnected();
      List<QuoteEntity> quotes;

      if (isConnected) {
        final apiResponse = await _remoteDataSource.fetchQuotes();

        final List<dynamic> quoteJsonList = apiResponse['results'];

        final List<QuoteModel> quoteModels = List<QuoteModel>.from(
          quoteJsonList.map((quoteJson) => QuoteModel.fromJson(quoteJson)),
        );
        quotes = quoteModels.map((quoteModel) => quoteModel.toEntity()).toList();

        await localDataSource.saveQuotes(quotes);
      } else {
        quotes = await localDataSource.getAllQuotes();
      }

      return quotes;
    } catch (e) {
      debugPrint('$e');
      return await localDataSource.getAllQuotes();
    }
  }

  @override
  Future<List<QuoteEntity>> getLocalQuotes() async{
    return await localDataSource.getAllQuotes();
  }


}
