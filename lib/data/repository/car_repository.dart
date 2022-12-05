import 'package:cars_app/data/models/cars_item_model.dart';
import '../services/api_services.dart';

class CarRepository {
  CarRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<CarsItemModel> getCarInfo() {
    return _apiService.getCarItemModel();
  }
}
