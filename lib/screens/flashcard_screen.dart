import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/models/category.dart';
import 'package:denge/models/language.dart';
import 'package:denge/models/word.dart';
import 'package:flutter/material.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({
    super.key,
    required this.category,
    required this.savedWords,
  });

  final Category category;
  final SavedWordsRepository savedWords;

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int _index = 0;

  List<Word> get _words => widget.category.words;
  bool get _isFirst => _index == 0;
  bool get _isLast => _index == _words.length - 1;

  void _showWordAt(int index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Image.asset(widget.category.imageAsset),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _WordCard(
                word: _words[_index],
                position: _index + 1,
                total: _words.length,
                savedWords: widget.savedWords,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                OutlinedButton.icon(
                  onPressed: _isFirst ? null : () => _showWordAt(_index - 1),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Önceki Kelime'),
                ),
                OutlinedButton.icon(
                  onPressed: _isLast ? null : () => _showWordAt(_index + 1),
                  icon: const Icon(Icons.arrow_forward),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Sonraki Kelime'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _WordCard extends StatelessWidget {
  const _WordCard({
    required this.word,
    required this.position,
    required this.total,
    required this.savedWords,
  });

  final Word word;
  final int position;
  final int total;
  final SavedWordsRepository savedWords;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 22),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors.onPrimary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$position/$total',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: savedWords.changes,
                builder: (context, _) {
                  final isSaved = savedWords.contains(word);
                  return IconButton.filled(
                    tooltip: isSaved ? 'Kaydedilenlerden çıkar' : 'Kaydet',
                    onPressed: () => savedWords.toggle(word),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.onPrimary,
                      foregroundColor: colors.primary,
                    ),
                    icon: Icon(
                      isSaved ? Icons.bookmark_remove : Icons.bookmark_add,
                    ),
                  );
                },
              ),
            ],
          ),
          for (final language in Language.values)
            _Translation(language: language, text: word.inLanguage(language)),
        ],
      ),
    );
  }
}

class _Translation extends StatelessWidget {
  const _Translation({required this.language, required this.text});

  final Language language;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          spacing: 15,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(language.flagAsset),
            ),
            Text(
              language.label,
              style: TextStyle(
                color: colors.onPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: colors.onPrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
