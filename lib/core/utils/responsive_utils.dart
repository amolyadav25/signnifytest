import 'package:flutter/material.dart';
import 'package:share_it/share_it.dart';
import '../../features/quotes/domain/entity/quote_entity.dart';

double getFontSize(double width) {
  if (width < 600) {
    return 20;
  } else if (width < 1200) {
    return 30;
  } else {
    return 40;
  }
}

double getAuthorFontSize(BoxConstraints constraints) {
  final width = constraints.maxWidth;
  if (width < 600) {
    return 20;
  } else if (width < 1200) {
    return 30;
  } else {
    return 40;
  }
}

void shareQuote(QuoteEntity quoteEntity) {
  ShareIt.text(
    content:
    'Check out this quote:\n${quoteEntity.content}\n- ${quoteEntity.author}',
  );
}

double getIconSize(BoxConstraints constraints) {
  final width = constraints.maxWidth;
  if (width < 600) {
    return 16;
  } else if (width < 600 && width > 1200) {
    return 24;
  } else {
    return 32;
  }
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
