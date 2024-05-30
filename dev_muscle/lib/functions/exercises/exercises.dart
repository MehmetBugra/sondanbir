import 'package:firebase_database/firebase_database.dart';

final DatabaseReference ref = FirebaseDatabase.instance.ref();

Future<Map<String, dynamic>> getExercises(String level) async {
  try {
    final snapshot = await ref.child("exercises/$level").get();
    final value = snapshot.value;
    print(value);
    return {"exercises": value};
  } catch (e) {
    print(e);
    return {"exercises": {}};
  }
}
