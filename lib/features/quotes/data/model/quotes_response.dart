class QuotesResponse {
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final List<QuoteItem> results;

  QuotesResponse({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  factory QuotesResponse.fromJson(Map<String, dynamic> json) {
    return QuotesResponse(
      count: json['count'],
      totalCount: json['totalCount'],
      page: json['page'],
      totalPages: json['totalPages'],
      lastItemIndex: json['lastItemIndex'],
      results: List<QuoteItem>.from(
        json['results'].map((quoteJson) => QuoteItem.fromJson(quoteJson)),
      ),
    );
  }
}

class QuoteItem {
  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  QuoteItem({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory QuoteItem.fromJson(Map<String, dynamic> json) {
    return QuoteItem(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      authorSlug: json['authorSlug'],
      length: json['length'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}
