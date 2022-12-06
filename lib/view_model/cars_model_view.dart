import 'package:cars_app/data/models/car_model.dart';
import 'package:cars_app/data/models/cars_item_model.dart';
import 'package:cars_app/data/repository/car_repository.dart';
import 'package:flutter/foundation.dart';

class CarsItemViewModel extends ChangeNotifier {
  CarsItemViewModel({required CarRepository carRepository}) {
    _carRepository = carRepository;
    fetchCarInfo();
  }

  late CarRepository _carRepository;

  bool isLoading = false;

  List<CarsItemModel> carsItemData=[];

  fetchCarInfo() async {
    notify(true);
    carsItemData=await _carRepository.getCarInfo();
    notify(false);
  }

  CarModel? carModel;

  fetchCarInfoById({required int id})async{
    notify(true);
    carModel=await _carRepository.getCarInfoId(id: id);
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}