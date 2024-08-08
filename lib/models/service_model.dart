class Service {
  final String id;
  final String title;
  final String url;
  final String categoryID;
  final List<String> forBreed;
  final List<String> forGender;
  final List<bool> forDesexed;
  final List<int> forAge;

  Service({
    required this.id,
    required this.title,
    required this.url,
    required this.categoryID,
    required this.forBreed,
    required this.forGender,
    required this.forDesexed,
    required this.forAge,
  });
}
