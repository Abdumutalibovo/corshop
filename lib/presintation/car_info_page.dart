import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/cars_model_view.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({
    Key? key,
    required this.carsItemViewModel,
  }) : super(key: key);

  final CarsItemViewModel carsItemViewModel;

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
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
      body: ChangeNotifierProvider.value(
        value: widget.carsItemViewModel,
        builder: (context,child){
          return Consumer<CarsItemViewModel>(
            builder: (context,counter,child){
              return counter.isLoading
                  ? const Center(child:  CircularProgressIndicator())
                  : (counter.carModel == null)
                  ? const Text("Hozircha data yuq"):
              Column(
                children: [
                  Text(counter.carModel!.description),
                  // CarouselSliderWiget(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
