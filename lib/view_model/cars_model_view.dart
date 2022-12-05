import 'package:cars_app/data/models/car_model.dart';
import 'package:cars_app/data/models/data_model.dart';
import 'package:cars_app/data/repository/car_repository.dart';
import 'package:flutter/foundation.dart';

class CarsItemViewModel extends ChangeNotifier {
  CarsItemViewModel({required CarRepository carRepository}) {
    _carRepository = carRepository;
    fetchCarInfo();
  }

  late CarRepository _carRepository;

  bool isLoading = false;

  CarsData? carsData;
  CarModel? carModel;

  fetchCarInfo() async {
    notify(true);
    carsData=await _carRepository.getCarInfo();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }

  fetchCarIdInfo({required int id})async{
    notify(true);
    carModel=await _carRepository.getCarInfoId(id: id);
    notify(false);
  }
}