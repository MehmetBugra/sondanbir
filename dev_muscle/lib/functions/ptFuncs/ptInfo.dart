import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getTrainerUsers() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('isTrainer', isEqualTo: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> trainers =
          querySnapshot.docs.map((doc) => doc.data()).toList();
      print(trainers);
      return Future.value(trainers);
    } else {
      print('Kullanıcı verisi bulunamadı.');
      return Future.value([]);
    }
  } catch (error) {
    print('Kullanıcı verileri alınamadı: $error');
    return Future.value([]);
  }
}
