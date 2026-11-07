import 'package:denge/data/word_adapter.dart';
import 'package:denge/models/word.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Persists the words the user bookmarked, keyed by [Word.id].
class SavedWordsRepository {
  SavedWordsRepository._(this._box);

  static const _storageDirectory = 'denge';
  static const _boxName = 'saved_words';

  final Box<Word> _box;

  static Future<SavedWordsRepository> open() async {
    await Hive.initFlutter(_storageDirectory);
    Hive.registerAdapter(WordAdapter());
    return SavedWordsRepository._(await Hive.openBox<Word>(_boxName));
  }

  /// Notifies listeners whenever a word is saved or removed.
  Listenable get changes => _box.listenable();

  List<Word> get words => _box.values.toList(growable: false);

  bool contains(Word word) => _box.containsKey(word.id);

  Future<void> toggle(Word word) => contains(word) ? remove(word) : save(word);

  Future<void> save(Word word) => _box.put(word.id, word);

  Future<void> remove(Word word) => _box.delete(word.id);
}
