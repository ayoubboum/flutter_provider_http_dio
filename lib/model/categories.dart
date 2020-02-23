class CategoriesList {
  final List<Categories> categories;

  CategoriesList({
    this.categories,
  });

  factory CategoriesList.fromJson(List<dynamic> parsedJson) {
    List<Categories> categories = List<Categories>();
    categories = parsedJson.map((i) => Categories.fromJson(i)).toList();
    return CategoriesList(
      categories: categories,
    );
  }
}

class Categories {
  int id;
  String name;

  Categories({this.id, this.name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
    );
  }
}
