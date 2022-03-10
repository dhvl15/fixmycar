import 'package:fix_my_car/models/car.dart';
import 'package:fix_my_car/models/user.dart';
import 'package:fix_my_car/services/auth.dart';
import 'package:fix_my_car/widgets/animal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  

  @override
  Widget build(BuildContext context) {

    final cars = Provider.of<List<CarData>>(context) ?? [];
    MyUser _user = AuthService().getCurrentUser();

    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return AnimalCard(
          heroTag: index.toString(),
          title: cars[index].modelName,
          type: "car",
          title2: cars[index].number,
          subtitle: cars[index].brand,
          foregroundurl: "asset/images/car.png",
          backgroundurl: "asset/images/settings.png",
        );
      },
    );
  }
}