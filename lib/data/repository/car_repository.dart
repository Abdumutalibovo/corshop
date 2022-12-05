import 'package:cars_app/data/models/cars_item_model.dart';
import 'package:cars_app/data/models/data_model.dart';
import '../models/car_model.dart';
import '../services/api_services.dart';

class CarRepository {
  CarRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<CarsData> getCarInfo() {
    return _apiService.getCarItemModel();
  }

  Future<CarModel> getCarInfoId({required int id}){
    return _apiService.getSingleCar(id: id);
  }
}
