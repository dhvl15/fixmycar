import 'package:fix_my_car/services/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fix_my_car/models/car.dart';

class ServiceCostCalculator extends StatefulWidget {
  const ServiceCostCalculator({Key key}) : super(key: key);

  @override
  _ServiceCostCalculatorState createState() => _ServiceCostCalculatorState();
}

class _ServiceCostCalculatorState extends State<ServiceCostCalculator> {
  final _formKey = GlobalKey<FormState>();

  List<String> _brands = ["Maruti","Hundai","Tata","Ford","Mahindra"];
  String _selectedBrand,_selectedCar;
  List<CarData> _cars;

  @override
  void initState() {
    super.initState();
    _cars = getCars();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0xff504944),
              // Color(0xffA28E8F),
              Colors.blueGrey,
              Colors.blueGrey.shade200,
            ],
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 0,
                child: ListView(
                  shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                FadeAnimation(
                  fadeDirection: FadeDirection.right,
                  delay: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingLeft,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Service-Cost Calculator',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil.instance.setSp(28),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(6),
                        ),
                        Text(
                          'find estimated prices',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(15),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
            ),
            SizedBox(height: 50),
            Expanded(
              child: ListView(
                children: [Form(
                  key: _formKey,
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal:15),
                      child: Container(
                        height: 55,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          value: _selectedBrand,
                          hint: Text(
                            _selectedBrand == null
                                ? "Select Brand"
                                : _selectedBrand,
                            style: TextStyle(fontSize: 12),
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedBrand = newValue;
                            });
                          },
                          items:_brands.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(fontSize: 12)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _selectedBrand != null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal:15),
                        child: Container(
                          height: 55,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedCar,
                            hint: Text(
                              _selectedCar == null
                                  ? "Select Car"
                                  : _selectedCar,
                              style: TextStyle(fontSize: 12),
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                _selectedCar = newValue;
                              });
                            },
                            items:_cars.where((element) => element.brand == _selectedBrand).toList().map((CarData value) {
                              return DropdownMenuItem<String>(
                                value: value.modelName,
                                child: Text(value.modelName,
                                    style: TextStyle(fontSize: 12)),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),]
              ),
            )
          ],
        )),
      ),
    );
  }
}
