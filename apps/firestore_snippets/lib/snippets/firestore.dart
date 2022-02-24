// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_snippets/snippets/snippet.dart';

class FirestoreSnippets extends DocSnippet implements Firestore {
  @override
  final FirebaseFirestore db;

  FirestoreSnippets(this.db);

  @override
  void runAll() {}

  void getStarted_addData() async {
    // [START get_started_add_data_1]
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    // [END get_started_add_data_1]
  }

  void getStarted_addData2() async {
    // [START get_started_add_data_2]
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "born": 1912
    };

    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    // [END get_started_add_data_2]
  }

  void getStarted_readData() async {
    // [START get_started_read_data]
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
    // [END get_started_read_data]
  }

  void dataModel_references() {
    // [START data_model_references]
    final alovelaceDocumentRef = db.collection("users").doc("alovelace");
    // [END data_model_references]

    // [START data_model_references2]
    final usersCollectionRef = db.collection("users");
    // [END data_model_references2]

    // [START data_model_references3]
    final aLovelaceDocRef = db.doc("users/alovelace");
    // [END data_model_references3]
  }

  void dataModel_subCollections() {
    // [START data_model_sub_collections]
    final messageRef = db
        .collection("rooms")
        .doc("roomA")
        .collection("messages")
        .doc("message1");
    // [END data_model_sub_collections]
  }

  void dataBundles_loadingClientBundles() {
    // [START data_bundles_loading_client_bundles]

    // [END data_bundles_loading_client_bundles]
  }
}
