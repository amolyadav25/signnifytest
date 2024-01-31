import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String id;
  final String content;
  final String author;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  const QuoteEntity({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  @override
  List<Object?> get props => [
    id,
    content,
    author,
    tags,
    authorSlug,
    length,
    dateAdded,
    dateModified,
  ];
}
