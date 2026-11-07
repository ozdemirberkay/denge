import 'package:denge/models/language.dart';
import 'package:denge/models/word.dart';
import 'package:flutter/material.dart';

class SavedWordTile extends StatelessWidget {
  const SavedWordTile({super.key, required this.word, required this.onRemove});

  final Word word;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 12),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 5,
        children: [
          CircleAvatar(backgroundImage: AssetImage(Language.english.flagAsset)),
          Expanded(child: _WordBox(word.english)),
          IconButton.filled(
            tooltip: 'Kaydedilenlerden çıkar',
            onPressed: onRemove,
            style: IconButton.styleFrom(
              backgroundColor: colors.onPrimary,
              foregroundColor: colors.primary,
            ),
            icon: const Icon(Icons.bookmark_remove),
          ),
          Expanded(child: _WordBox(word.turkish)),
          CircleAvatar(backgroundImage: AssetImage(Language.turkish.flagAsset)),
        ],
      ),
    );
  }
}

class _WordBox extends StatelessWidget {
  const _WordBox(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
