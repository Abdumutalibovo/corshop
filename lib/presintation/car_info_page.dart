import 'package:cars_app/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/cars_model_view.dart';

class CarInfoScreen extends StatefulWidget {
  final int id;
  const CarInfoScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<CarsItemViewModel>().fetchCarIdInfo(id: 5));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Car Info",
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
      body: Consumer<CarsItemViewModel>(
        builder: (context,counter,child){
          return counter.isLoading
              ? Center(child: const CircularProgressIndicator())
              : (counter.carModel == null)
              ? const Text("Hozircha data juq"):
              Column(
                children: [
                  Text(counter.carModel!.description),
                  // Image.network(counter.carModel!.logo[widget.id]),
                ],
              );
        },
      ),
    );
  }
}
