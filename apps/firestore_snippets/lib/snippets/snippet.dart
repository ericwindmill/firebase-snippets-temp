/*
Base class for all Snippets
 */
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DocSnippet {
  void runAll();
}

class Firestore {
  final FirebaseFirestore db;

  Firestore(this.db);
}
