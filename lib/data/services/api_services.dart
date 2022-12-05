import 'dart:convert';
import 'package:cars_app/data/models/cars_item_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ApiService {
  Future<CarsItemModel> getCarItemModel() async {
    try {
      Response response =
          await https.get(Uri.parse("https://api.agify.io/?name=bella"));
      if (response.statusCode == 200) {
        CarsItemModel carsItemModel =
            CarsItemModel.fromJson(jsonDecode(response.body));
        debugPrint(carsItemModel.id.toString());
        return carsItemModel;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
