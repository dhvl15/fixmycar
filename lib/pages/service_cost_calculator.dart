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

  List<String> _brands = ["Maruti","Hyundai","Tata","Mahindra","Honda"];
  List<String> _serviceTypeList = ["service cost","repair / replacement"];
  String _selectedBrand,_serviceType;
  CarData _selectedCar;
  List<CarData> _cars;
  List _services =[],_parts=[];
  List _selectedService =[];
  int _cost;

  @override
  void initState() {
    super.initState();
    _cars = getCars();
    _services = getService();
    _parts = getParts();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _selectedService.isNotEmpty,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 1.5,
          //mini: true,
          onPressed: () {
            setState(() {
              _cost = calculate();
            });
            dialog(context);
          },
          label: Text("calculate"),
        ),
      ),
      body: Material(
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
    
                      //Car model
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
                                    : _selectedCar.modelName,
                                style: TextStyle(fontSize: 12),
                              ),
                              onChanged: (CarData newValue) {
                                setState(() {
                                  _selectedCar = newValue;
                                });
                              },
                              items:_cars.where((element) => element.brand == _selectedBrand).map((CarData value) {
                                return DropdownMenuItem<CarData>(
                                  value: value,
                                  child: Text("${value.modelName} (${value.fuel})",
                                      style: TextStyle(fontSize: 12)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
    
                      //fuel
                      Visibility(
                        visible: _selectedCar != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal:15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text("Fuel : "),
                                  ),
                                  Card(
                                    color: _selectedCar!=null ? _selectedCar.fuel == "petrol" ? Colors.green : Colors.blueGrey :null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text("Petrol"),
                                    ),
                                  ),
                                  Card(
                                    color: _selectedCar!=null ? _selectedCar.fuel == "diesel" ? Colors.green : null :null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text("Diesel"),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      
                      //service type
                      Visibility(
                        visible: _selectedCar != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal:15),
                          child: Container(
                            height: 55,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              value: _serviceType,
                              hint: Text(
                                _selectedCar != null
                                    ? "Choose service type"
                                    : _serviceType ?? "   ",
                                style: TextStyle(fontSize: 12),
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  _serviceType = newValue;
                                });
                              },
                              items:_serviceTypeList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 12)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _serviceType != null,
                        child: Padding(
                        padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal:15),
                        child:_serviceType != null ? Column(
                          children: List.generate(
                            _serviceType == _serviceTypeList[0] ? _services.length: _parts.length,
                             (index){
                              dynamic item = _serviceType.contains(_serviceTypeList[0])  ? _services[index]: _parts[index];
                              //print(item.toString());
                              return CheckboxListTile(
                                //secondary: _cost != null ? Text(item['cost'].toString()) : null,
                                title: Text(item['label'] ?? ""),
                                subtitle: _serviceType == _serviceTypeList[0] ? Text(item["parts"]) : null,
                                value: _selectedService.contains(item), 
                                onChanged: (bool value){
                                  if (value) {
                                    setState(() {
                                      _selectedService.add(item);
                                    });
                                  } else {
                                    setState(() {
                                      _selectedService.remove(item);
                                    });
                                  }
                                });
                              
                             }),
                        ) : Container(),
                            
                        )
                      )
                    ],
                  )),
                  ]
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  int calculate(){
    int price = 0;
    for (var item in _selectedService) {
      price = price + item["cost"] + _selectedCar.x;
    }
    print(price);
    return price;
  }


  void dialog(BuildContext context)async {
    
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Total service cost"),
            content: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _buildListView()),
                  ],
              ),
            ),
            actions: [
              Text("Total : "+_cost.toString()),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text('cancle')),
            ],
            actionsAlignment: MainAxisAlignment.spaceBetween,
          );
        });
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _selectedService.length + 1,
      //separatorBuilder: (ctx, i) => Divider(height: 0),
      itemBuilder: (context, index) {
        if (index<_selectedService.length) {
          final item = _selectedService[index];
          return ListTile(
              title: Text(
                item["label"],
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(item["cost"].toString()),
              
              );
        }else{
          return ListTile(
              subtitle: Text(
                "additional taxes applicable*",
              ),
              );
          
        }
      },
    );
  }

  
}
