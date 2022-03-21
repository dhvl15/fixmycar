class CarData {

  final String brand;
  final String modelName;
  final String fuel;
  final String transmission;
  final String number;
  String id;
  int x;

  CarData({ this.brand, this.modelName, this.fuel, this.transmission, this.id, this.number, this.x});

}

List<CarData> getCars(){
  return _models;
}

List getService(){
  return services;
}

List getParts(){
  return parts;
}



List<CarData> _models = [
  CarData(brand: "Maruti", modelName: "baleno", fuel: "petrol",transmission: "",id: "0",x:0),
  CarData(brand: "Maruti", modelName: "baleno", fuel: "diesel",transmission: "",id: "1", x:300),
  CarData(brand: "Maruti", modelName: "swift dzire", fuel: "petrol",transmission: "",id: "2", x:150),
  CarData(brand: "Maruti", modelName: "swift dzire", fuel: "diesel",transmission: "",id: "3", x:700),
  CarData(brand: "Maruti", modelName: "wagonR", fuel: "petrol",transmission: "",id: "4" , x : 250),

  CarData(brand: "Hyundai", modelName: "creta", fuel: "petrol",transmission: "",id: "5",x:2500),
  CarData(brand: "Hyundai", modelName: "creta", fuel: "diesel",transmission: "",id: "6", x:2800),
  CarData(brand: "Hyundai", modelName: "verna", fuel: "petrol",transmission: "",id: "7", x:2600),
  CarData(brand: "Hyundai", modelName: "verna", fuel: "diesel",transmission: "",id: "8", x:2750),
  CarData(brand: "Hyundai", modelName: "I20 new", fuel: "petrol",transmission: "",id: "9" , x : 950),
  CarData(brand: "Hyundai", modelName: "I20 new", fuel: "diesel",transmission: "",id: "10" , x : 1250),

  CarData(brand: "Tata", modelName: "nexon", fuel: "petrol",transmission: "",id: "11",x:1500),
  CarData(brand: "Tata", modelName: "nexon", fuel: "diesel",transmission: "",id: "12", x:1750),
  CarData(brand: "Tata", modelName: "harrier", fuel: "diesel",transmission: "",id: "13", x:6050),
  CarData(brand: "Tata", modelName: "tigor", fuel: "petrol",transmission: "",id: "14", x:450),
  CarData(brand: "Tata", modelName: "safari 2021", fuel: "diesel",transmission: "",id: "16" , x : 6500),

  CarData(brand: "Honda", modelName: "city", fuel: "petrol",transmission: "",id: "17",x:200),
  CarData(brand: "Honda", modelName: "city", fuel: "diesel",transmission: "",id: "18", x:900),
  CarData(brand: "Honda", modelName: "amaze", fuel: "petrol",transmission: "",id: "19", x:320),
  CarData(brand: "Honda", modelName: "amaze", fuel: "diesel",transmission: "",id: "20", x:840),

  CarData(brand: "Mahindra", modelName: "xuv300", fuel: "petrol",transmission: "",id: "21",x:1600),
  CarData(brand: "Mahindra", modelName: "xuv300", fuel: "diesel",transmission: "",id: "22", x:700),
  CarData(brand: "Mahindra", modelName: "xuv500", fuel: "diesel",transmission: "",id: "24", x:400),
];

List services = [
  {"cost" : 0, "label" : "first service - 1000 Kms or 1 Month", "parts" : "(Engine Oil, Oil Filter)"},
  {"cost" : 0, "label" : "second service - 5000 Kms or 6 Month","parts" : "(Engine Oil, Oil Filter)"},
  {"cost" : 2450, "label" : "third service - 10,000 Kms or 1 Year","parts" : "(Engine Oil, Oil Filter, Alignment & Balancing)"},
  {"cost" : 5050, "label" : "fourth service - 20,000 Kms or 2 Year","parts" : "(Engine Oil, Oil Filter, Brake Fluid, Coolant, Alignment & Balancing, Labor)"},
  {"cost" : 4500, "label" : "fifth service - 30,000 Kms or 3 Year","parts" : "(Engine Oil, Oil Filter, Cabin AC Filter, Alignment & Balancing, Labor)"},
  {"cost" : 6550, "label" : "sixth service - 40,000 Kms or 4 Year","parts" : "(Engine Oil, Oil Filter, Fuel Filter, Spark Plug, Air Filter, Brake Fluid, Coolant, Alignment & Balancing, Labor)"},
  {"cost" : 4050, "label" : "seventh service - 50,000 Kms or 5 Year","parts" : " (Engine Oil, Oil Filter, Alignment & Balancing, Labor)"},
  ];

List parts = [
  {"label" : "battery", "cost" : 3000},
  {"label" :"engine Oil" , "cost": 1450},
  {"label" :"ac service" , "cost": 1900},
  {"label" : "wiper blade", "cost" : 600},
  {"label" : "tyres" , "cost": 16000},
  {"label" :"spark plug", "cost" : 450}
];