import 'package:cars_app/data/models/cars_model.dart';
import 'package:cars_app/data/repository/car_repository.dart';
import 'package:flutter/foundation.dart';

class CarsItemViewModel extends ChangeNotifier {
  CarsItemViewModel({required CarRepository carRepository}) {
    _carRepository = carRepository;
    fetchCarInfo();
  }

  late CarRepository _carRepository;

  bool isLoading = false;

  CarsModel? carsModel;

  fetchCarInfo() async {
    notify(true);
    carsModel = (await _carRepository.getCarInfo()) as CarsModel;
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}