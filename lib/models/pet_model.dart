class Pet {
  final String id;
  final String name;
  final String breed;
  final String gender;
  final DateTime dateOfBirth;
  final bool deSexed;
  final String from;
  final String image;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.gender,
    required this.dateOfBirth,
    required this.deSexed,
    required this.from,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'breed': breed,
        'gender': gender,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'deSexed': deSexed,
        'from': from,
        'image': image,
      };

  static Pet fromJson(Map<String, dynamic> json) => Pet(
        id: json['id'],
        name: json['name'],
        breed: json['breed'],
        gender: json['gender'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        deSexed: json['deSexed'],
        from: json['from'],
        image: json['image'],
      );
}
