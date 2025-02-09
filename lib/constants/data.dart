import 'package:denge/constants/strings.dart';
import 'package:denge/model/category.dart';
import 'package:denge/model/category_data.dart';

class AppData {
  static const enFlag = "assets/images/flag/en.png";
  static const trFlag = "assets/images/flag/tr.png";

  static const List<String> _names = [
    "Eşyalar",
    "Mevsimler",
    "Hayvanlar",
    "Sporlar",
    "Meslekler",
    "Aylar",
    "Renkler",
    "Günler"
  ];

  static const List<String> _photos = [
    "assets/images/category/tool.png",
    "assets/images/category/season.png",
    "assets/images/category/animal.png",
    "assets/images/category/sport.png",
    "assets/images/category/occupation.png",
    "assets/images/category/month.png",
    "assets/images/category/color.png",
    "assets/images/category/day.png"
  ];

  static const List<List<Map<String, String>>> _data = [
    Strings.esyalar,
    Strings.mevsimler,
    Strings.hayvanlar,
    Strings.sporlar,
    Strings.meslekler,
    Strings.aylar,
    Strings.renkler,
    Strings.gunler
  ];

  static List<Category> categories = Iterable<int>.generate(8)
      .map((index) => Category(
          name: _names[index],
          photo: _photos[index],
          data: _data[index]
              .map((element) => CategoryData.fromMap(element))
              .toList()))
      .toList();
}
