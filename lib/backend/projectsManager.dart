import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsManager {
  final _store = FirebaseFirestore.instance;
  Stream getProjectsFromFirebase() {
    // Stream<QuerySnapshot<Map<String, dynamic>>> x = _store.collection('skillsDB').snapshots() as Map;
    var x = _store.collection('projectsDB').snapshots();
    return x;
  }
}
