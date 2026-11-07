import 'package:denge/models/word.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 0;

  @override
  Word read(BinaryReader reader) =>
      Word(turkish: reader.readString(), english: reader.readString());

  @override
  void write(BinaryWriter writer, Word obj) => writer
    ..writeString(obj.turkish)
    ..writeString(obj.english);
}
