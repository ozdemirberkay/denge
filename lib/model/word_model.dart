import 'package:hive_flutter/hive_flutter.dart';

part 'word_model.g.dart';

@HiveType(typeId: 1)
class DengeWord {
  @HiveField(0)
  final String turkish;

  @HiveField(1)
  final String english;

  DengeWord(this.turkish, this.english);

  @override
  String toString() {
    return "$turkish --- $english\n";
  }
}
