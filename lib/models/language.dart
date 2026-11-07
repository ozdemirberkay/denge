enum Language {
  english(label: 'İngilizce', flagAsset: 'assets/images/flag/en.png'),
  turkish(label: 'Türkçe', flagAsset: 'assets/images/flag/tr.png');

  const Language({required this.label, required this.flagAsset});

  final String label;
  final String flagAsset;
}
