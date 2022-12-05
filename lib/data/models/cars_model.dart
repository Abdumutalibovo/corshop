class CarsModel {
  int id;
  String carModel;
  String logo;
  int establishedYear;
  int averagePrice;
  String description;
  List<String> carPics;

  CarsModel({
    required this.id,
    required this.carModel,
    required this.logo,
    required this.establishedYear,
    required this.averagePrice,
    required this.description,
    required this.carPics,
  });

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      id: json['id'] as int? ?? 0,
      carModel: json['car_model'] as String? ?? "",
      averagePrice: json['average_price'] as int? ??0,
      logo: json['logo'] as String? ?? "",
      establishedYear: json['established_year'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      carPics: List<String>.from(json["car_pics"].map((e) => e)),
    );
  }
}
