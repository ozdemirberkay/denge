import 'package:denge/data/saved_words_repository.dart';
import 'package:denge/models/category.dart';
import 'package:denge/screens/categories_screen.dart';
import 'package:denge/screens/saved_words_screen.dart';
import 'package:flutter/material.dart';

enum _Tab {
  categories('Kategoriler', Icons.grid_view_outlined, Icons.grid_view_rounded),
  saved('Kaydedilenler', Icons.bookmark_border, Icons.bookmark);

  const _Tab(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.categories,
    required this.savedWords,
  });

  final List<Category> categories;
  final SavedWordsRepository savedWords;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _Tab _currentTab = _Tab.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentTab.label)),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          for (final tab in _Tab.values)
            switch (tab) {
              _Tab.categories => CategoriesScreen(
                categories: widget.categories,
                savedWords: widget.savedWords,
              ),
              _Tab.saved => SavedWordsScreen(savedWords: widget.savedWords),
            },
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab.index,
        onDestinationSelected: (index) =>
            setState(() => _currentTab = _Tab.values[index]),
        destinations: [
          for (final tab in _Tab.values)
            NavigationDestination(
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon),
              label: tab.label,
            ),
        ],
      ),
    );
  }
}
