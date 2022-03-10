class CarData {

  final String brand;
  final String modelName;
  final String fuel;
  final String transmission;
  final String number;
  String id;

  CarData({ this.brand, this.modelName, this.fuel, this.transmission, this.id, this.number});

}

List<CarData> getCars(){
  return _models;
}


List<CarData> _models = [
  CarData(brand: "Maruti", modelName: "baleno", fuel: "",transmission: "",id: "0"),
  CarData(brand: "Maruti", modelName: "sx4", fuel: "",transmission: "",id: "1"),
  CarData(brand: "Maruti", modelName: "wagonR", fuel: "",transmission: "",id: "2"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "3"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "4"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "5"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "6"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "7"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "8"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "9"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "10"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "11"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "12"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "13"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "14"),
  // CarData(brand: "Maruti", modelName: "", fuel: "",transmission: "",id: "15"),
];