import 'package:denge/models/language.dart';

class Word {
  const Word({required this.turkish, required this.english});

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    turkish: json['turkish'] as String,
    english: json['english'] as String,
  );

  final String turkish;
  final String english;

  /// Stable identifier used as the storage key for saved words.
  String get id => '$english|$turkish';

  String inLanguage(Language language) => switch (language) {
    Language.english => english,
    Language.turkish => turkish,
  };
}
