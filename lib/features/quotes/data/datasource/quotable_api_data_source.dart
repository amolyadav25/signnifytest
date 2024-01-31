import '../../../../core/network/api_client.dart';

import '../../../../core/network/api_path.dart';

class QuotableApiDataSource {
  final ApiClient _apiClient;

  QuotableApiDataSource(this._apiClient);

  Future<Map<String, dynamic>> getRandomQuote() async {
    try {
      return await _apiClient.getRequest(ApiPath.randomUrl);
    } catch (e) {
      throw Exception('Failed to load random quote');
    }
  }

  Future<Map<String, dynamic>> fetchQuotes() async {
    try {
      return await _apiClient.getRequest(ApiPath.quotes);
    } catch (e) {
      throw Exception('Failed to load quotes');
    }
  }
}
