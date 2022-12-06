import 'package:cars_app/data/models/cars_item_model.dart';
import '../models/car_model.dart';
import '../services/api_services.dart';

class CarRepository {
  CarRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<List<CarsItemModel>> getCarInfo() {
    return _apiService.getAllCarInfo();
  }

  Future<CarModel> getCarInfoId({required int id}){
    return _apiService.getCarInfo(id: id);
  }
}
