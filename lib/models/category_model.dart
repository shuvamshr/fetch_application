class Category {
  final String id;
  final String title;
  final String description;
  final String image;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
      };

  static Category fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
      );
}
