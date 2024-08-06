import 'package:cloud_firestore/cloud_firestore.dart';

class SkillsManager {
  final _store = FirebaseFirestore.instance;
  Stream getSkillsFromFirebase() {
    // Stream<QuerySnapshot<Map<String, dynamic>>> x = _store.collection('skillsDB').snapshots() as Map;
    var x = _store.collection('skillsDB').snapshots();
    return x;
  }
}
