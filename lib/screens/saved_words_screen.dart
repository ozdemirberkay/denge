import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/widgets/saved_word_tile.dart';
import 'package:flutter/material.dart';

class SavedWordsScreen extends StatelessWidget {
  const SavedWordsScreen({super.key, required this.savedWords});

  final SavedWordsRepository savedWords;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const headerStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

    return ListenableBuilder(
      listenable: savedWords.changes,
      builder: (context, _) {
        final words = savedWords.words;

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('İNGİLİZCE', style: headerStyle),
                  Text('TÜRKÇE', style: headerStyle),
                ],
              ),
            ),
            Divider(
              color: colors.primary,
              thickness: 3,
              height: 3,
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: words.isEmpty
                  ? const Center(
                      child: Text(
                        'Henüz kaydedilmiş kelime yok',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: words.length,
                      itemBuilder: (context, index) => SavedWordTile(
                        word: words[index],
                        onRemove: () => savedWords.remove(words[index]),
                      ),
                    ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(18, 0, 18, 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Kaydedilen Kelime Sayısı: ${words.length}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
