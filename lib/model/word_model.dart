import 'package:hive/hive.dart';
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
    return turkish.toString() + " --- " + english.toString() + "\n";
  }
}
