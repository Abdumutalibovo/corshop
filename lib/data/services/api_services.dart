import 'package:cars_app/data/models/car_model.dart';
import 'package:cars_app/data/models/cars_item_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<List<CarsItemModel>> getAllCarInfo() async {
    try {
      Response response = await http
          .get(Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body)["data"] as List?;
        return jsonData?.map((e) => CarsItemModel.fromJson(e)).toList() ?? [];
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<CarModel> getCarInfo({required int id}) async {
    try {
      Response response = await http.get(
          Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies/$id"));
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
