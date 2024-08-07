import 'package:fetch_application/models/category_model.dart';

class Service {
  final String id;
  final String title;
  final String url;
  final Category forCategory;
  final List<String> forBreed;
  final List<String> forGender;
  final List<bool> forDesexed;
  final List<int> forAge;

  Service({
    required this.id,
    required this.title,
    required this.url,
    required this.forCategory,
    required this.forBreed,
    required this.forGender,
    required this.forDesexed,
    required this.forAge,
  });
}
