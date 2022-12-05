import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/data/services/api_services.dart';
import 'package:cars_app/presintation/home_page.dart';
import 'package:cars_app/view_model/cars_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  CarRepository carRepository = CarRepository(apiService: ApiService());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CarsItemViewModel(carRepository: carRepository))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Cars App',
        home: HomeScreen());
  }
}
