import 'package:cars_app/data/models/car_model.dart';
import 'package:cars_app/data/models/data_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<CarsData> getCarItemModel() async {
    try {
      Response response = await http
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));
      if (response.statusCode >= 200) {
        return CarsData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<CarModel> getSingleCar({required int id}) async {
    try {
      Response response = await http
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/$id"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return CarModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}