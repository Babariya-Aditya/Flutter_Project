class Category{
  int? id;
  String title;
  String description;
  int date = DateTime.now().microsecondsSinceEpoch;
  Category({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'date': this.date,
    };
  }
}