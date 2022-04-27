import 'dart:convert';

CategoryData categoryDataFromMap(String str) =>
    CategoryData.fromMap(json.decode(str));

String categoryDataToMap(CategoryData data) => json.encode(data.toMap());

class CategoryData {
  CategoryData({required this.turkce, required this.ingilizce});

  final String turkce;
  final String ingilizce;

  factory CategoryData.fromMap(Map<String, dynamic> json) => CategoryData(
        turkce: json["turkce"],
        ingilizce: json["ingilizce"],
      );

  Map<String, dynamic> toMap() => {
        "turkce": turkce,
        "ingilizce": ingilizce,
      };

  @override
  String toString() {
    return "türkce: $turkce   ingilizce: $ingilizce ";
  }
}
