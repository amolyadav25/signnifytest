import '../../domain/entity/quote_entity.dart';
import 'package:hive/hive.dart';

class QuoteLocalDataSource {
  static const String boxName = 'quotes';

  Future<void> saveQuote(QuoteEntity quote) async {
    final box = await Hive.openBox<QuoteEntity>(boxName);
    await box.add(quote);
  }

  Future<void> saveQuotes(List<QuoteEntity> quotes) async {
    final box = await Hive.openBox<QuoteEntity>(boxName);

    await box.clear();

    for (var quote in quotes) {
      box.add(quote);
    }
  }

  List<QuoteEntity> getAllQuotes() {
    final box = Hive.box<QuoteEntity>(boxName);
    return box.values.toList();
  }
}
