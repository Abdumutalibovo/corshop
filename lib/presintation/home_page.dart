import 'package:cars_app/data/repository/car_repository.dart';
import 'package:cars_app/presintation/car_info_page.dart';
import 'package:cars_app/view_model/cars_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel=CarsItemViewModel(
        carRepository: CarRepository(apiService: ApiService()));
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      builder: (context, child) {
        var counter = Provider.of<CarsItemViewModel>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Cars Item",
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
          ),
          body: counter.isLoading
              ? Center(child: const CircularProgressIndicator())
              : (counter.carsItemData == null
                  ? const Text("Hozircha data juq")
                  : Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: GridView.builder(
                          itemCount: counter.carsItemData.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            var item = counter.carsItemData[index];
                            return InkWell(
                              onTap: () {
                                counter.fetchCarInfoById(id: item.id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CarInfoScreen(carsItemViewModel: viewModel,)));
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Image.network(
                                    counter.carsItemData[index].logo,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),
        );
      },
    );
  }
}
