class Category {
  int? id;
  String? title;
  String? description;
  String? imagePath;
  int? date = DateTime.now().microsecondsSinceEpoch;

  Category({required this.title, required this.description,this.imagePath});

  Category.withId({this.id, this.title, this.description, this.date, this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'image' : this.imagePath,
      'date': this.date,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category.withId(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      imagePath :map['image'] as String,
      date: map['date'] as int,
    );
  }
// Map<String, dynamic> toMap() {
//   return {
//     'title': this.title,
//     'description': this.description,
//     'date': this.date,
//   };
//}
}
