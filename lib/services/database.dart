import 'package:fix_my_car/models/car.dart';
import 'package:fix_my_car/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference collection = FirebaseFirestore.instance.collection('fixmycar');
  
  Future<void> updateUserData({String name, String email,String imageUrl}) async {
    //fridgeCollection.doc(uid).collection('fridge').add({'name' : '','expiryDate' : DateTime.now(),});
    return await collection.doc(uid).set({
      'name': name,
      'email':email,
      'imageUrl':imageUrl
    },
    );
  }

  // car list from snapshot
  List<CarData> _carListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return CarData(
        id : doc.id,
        brand: doc.get('brand'),
        modelName: doc.get('modelName'),
        number: doc.get('number'),
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name'),
      email: snapshot.get('email'), 
      imageUrl: snapshot.get('imageUrl'),
    );
  }

  // get car stream
  Stream<List<CarData>> get car {
    final CollectionReference car = collection.doc(uid).collection('cars');
    return car.snapshots()
      .map(_carListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return collection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  //add to car list 
  Future<void> updatUserCarData({String modelName, String brand, String number}) async {
    return await collection.doc(uid).collection('cars').add(
      {
        'modelName' : modelName,
        'brand':brand,
        'number' : number
      });
  }

  //delete from car list
  Future<void> deleteData({String id}) async {
   return await collection.doc(uid).collection('cars').doc(id).delete();
  }

}