class CarsItemModel {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int estableshedYear;

  CarsItemModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.estableshedYear,
  });

  factory CarsItemModel.fromJson(Map<String, Object?> json) {
    return CarsItemModel(
      id: json['id'] as int? ?? 0,
      carModel: json['car_model'] as String? ?? "",
      averagePrice: json['average_price'] as int? ?? 0,
      logo: json['logo'] as String? ?? "",
      estableshedYear: json['established_year'] as int? ?? 0,
    );
  }
}
