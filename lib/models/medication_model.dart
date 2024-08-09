class Medication {
  final String id;
  final String title;
  final String url;
  final String categoryID;
  final String image;
  final List<String> forBreed;
  final List<String> forGender;
  final List<bool> forDesexed;
  final List<int> forAge;

  Medication({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
    required this.categoryID,
    required this.forBreed,
    required this.forGender,
    required this.forDesexed,
    required this.forAge,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'categoryID': categoryID,
        'image': image,
        'forBreed': forBreed,
        'forGender': forGender,
        'forDesexed': forDesexed,
        'forAge': forAge,
      };

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        categoryID: json['categoryID'],
        image: json['image'],
        forBreed: List<String>.from(json['forBreed']),
        forGender: List<String>.from(json['forGender']),
        forDesexed: List<bool>.from(json['forDesexed']),
        forAge: List<int>.from(json['forAge']),
      );
}
