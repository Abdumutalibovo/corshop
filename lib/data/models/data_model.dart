import 'cars_item_model.dart';

class CarsData{
  final List<CarsItemModel> carsItemDate;

  CarsData({required this.carsItemDate});

  factory CarsData.fromJson(Map<String,dynamic>json){
    return  CarsData(
      carsItemDate: (json["data"] as List).map((e) => CarsItemModel.fromJson(e)).toList(),
    );
  }
}