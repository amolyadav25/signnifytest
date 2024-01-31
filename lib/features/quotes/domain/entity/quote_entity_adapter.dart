import 'package:hive/hive.dart';
import 'quote_entity.dart';

class QuoteEntityAdapter extends TypeAdapter<QuoteEntity> {
  @override
  final int typeId = 1;

  @override
  QuoteEntity read(BinaryReader reader) {
    return QuoteEntity(
      id: reader.readString(),
      content: reader.readString(),
      author: reader.readString(),
      tags: (reader.readList()).cast<String>(),
      authorSlug: reader.readString(),
      length: reader.readInt(),
      dateAdded: reader.readString(),
      dateModified: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, QuoteEntity obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.content);
    writer.writeString(obj.author);
    writer.writeList(obj.tags);
    writer.writeString(obj.authorSlug);
    writer.writeInt(obj.length);
    writer.writeString(obj.dateAdded);
    writer.writeString(obj.dateModified);
  }
}
