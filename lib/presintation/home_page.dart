import 'package:cars_app/presintation/car_info_page.dart';
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
        title: const Text(
          "Cars Item",
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CarsItemViewModel>(
            builder: (context, counter, child) {
              return counter.isLoading
                  ? Center(child: const CircularProgressIndicator())
                  : (counter.carsData == null
                      ? const Text("Hozircha data juq")
                      : Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: GridView.builder(
                              itemCount: counter.carsData!.carsItemDate.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CarInfoScreen(
                                                  id: counter.carModel!.id,
                                                )));
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                      child: Image.network(
                                        counter
                                            .carsData!.carsItemDate[index].logo,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ));
            },
          ),
        ],
      ),
    );
  }
}
