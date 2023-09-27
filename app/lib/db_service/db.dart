//import 'package:app/db_service/db_enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class DatabaseHandler {
  DocumentReference<Map<String, dynamic>>? getDoc<T>(T t, String field) {
    return _firestore.collection(t.toString()).doc(field);
  }

  Future<bool> insertData<T>(
      T t, String field, Map<String, dynamic> data) async {
    bool success = false;
    await getDoc(t, field)
        ?.set(data)
        .whenComplete(() => success = true)
        .onError((error, stackTrace) => success = false);

    return success;
  }

  /*String target<T>(T t) {
    return Target.values.byName(t.toString().toLowerCase()).name;
  }*/
}
