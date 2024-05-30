// ignore_for_file: unnecessary_type_check, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

final FirebaseAuth auth = FirebaseAuth.instance;
final DatabaseReference ref =
    FirebaseDatabase.instance.ref('users/${auth.currentUser!.uid}/foods');

final DatabaseReference foodref = FirebaseDatabase.instance.ref();

final String _collectionPath = "users/${auth.currentUser!.uid}/foods";

Future<Map<String, dynamic>> fetchFoods() async {
  try {
    final snapshot = await foodref.child('foods').get();
    // print("aaaa: ${snapshot.value}");

    final Object? value = snapshot.value;
    // print("dfdsfdsfg $value");

    return {'foods': value};

    // Veri yoksa veya snapshot.exists false ise boş bir harita döndürün
    // return {'foods2': {}};
  } catch (e) {
    // Hata durumunda boş bir harita döndürün
    print('Error fetching foods: $e');
    return {'foods': {}};
  }
}

Future<void> addFoods(Map food) async {
  print(food);

  await db
      .collection(_collectionPath)
      .doc(
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}/")
      .collection("items")
      .doc("${DateTime.now().microsecond}")
      .set(
    {
      "carb": food['carb'],
      "food_name": food['food_name'],
      "protein": food['protein'],
      "fat": food['fat'],
      "cal": food['cal'],
    },
  );
}

Future<Map<String, dynamic>> getFoodwithDay(
    int year, int month, int day) async {
  print("$year-$month-$day");
  double _cal = 0;
  double _pro = 0;
  double _carb = 0;
  double _fat = 0;
  try {
    QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection(_collectionPath)
            .doc("$year-$month-$day")
            .collection("items")
            .get();
    int r = 0;
    documentSnapshot.docs.forEach(
      (element) {
        _cal += element['cal'];
        _carb += element['carb'];
        _pro += element['protein'];
        _fat += element['fat'];
      },
    );
    return Future.value({
      "carb": _carb,
      "protein": _pro,
      "fat": _fat,
      "cal": _cal,
    });
  } catch (error) {
    print('Kullanıcı verileri alınamadı: $error');
    return Future.value({});
  }
}

Future<Map<String, dynamic>> getFoodData(int year, int month, int day) async {
  try {
    QuerySnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection(_collectionPath)
            .doc("$year-$month-$day")
            .collection("items")
            .get();

    Map<String, dynamic> foodMap = {};
    documentSnapshot.docs.forEach((doc) {
      foodMap[doc.id] = doc.data();
    });

    return foodMap;
  } catch (error) {
    print('Hata oluştu: $error');
    return {};
  }
}
