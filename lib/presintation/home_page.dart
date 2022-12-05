import 'package:cars_app/view_model/cars_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Cars Item",style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.black54,
            ),
          ),
          Consumer<CarsItemViewModel>(
            builder: (context, counter, child) {
              return Center(
                child: counter.isLoading
                    ? const CircularProgressIndicator()
                    : (counter.carsModel == null
                    ? const Text("Hozircha data juq")
                    : Column(
                  children: [
                    Text(counter.carsModel!.id.toString()),
                    Text(counter.carsModel!.description.toString()),
                    Text(counter.carsModel!.establishedYear.toString()),
                  ],
                )),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CarsItemViewModel>(context,listen: true).fetchCarInfo();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}