// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_snippets/snippets/custom_snippets/firestore_add_data_custom_objects_snippet.dart';
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
    // TODO - currently in scratch file
    // [END data_bundles_loading_client_bundles]
  }

  void addData_setADocument() {
    // [START add_data_set_document_1]
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA"
    };

    db
        .collection("cities")
        .doc("LA")
        .set(city)
        .onError((e, _) => print("Error writing document: $e"));
    // [END add_data_set_document_1]
  }

  void addData_setADocument2() {
    // [START add_data_set_document_2]
    // Update one field, creating the document if it does not already exist.
    final data = {"capital": true};

    db.collection("cities").doc("BJ").set(data, SetOptions(merge: true));
    // [END add_data_set_document_2]
  }

  void addData_dataTypes() {
    // [START add_data_data_types]
    final docData = {
      "stringExample": "Hello world!",
      "booleanExample": true,
      "numberExample": 3.14159265,
      "dateExample": Timestamp.now(),
      "listExample": [1, 2, 3],
      "nullExample": null
    };

    final nestedData = {
      "a": 5,
      "b": true,
    };

    docData["objectExample"] = nestedData;

    db
        .collection("data")
        .doc("one")
        .set(docData)
        .onError((e, _) => print("Error writing document: $e"));
    // [END add_data_data_types]
  }

  void addData_customObjects() {
    // [START add_data_custom_objects]
    // TODO: is this supported in Dart yet?
    // in the current docs, it isn't supported for about half the languages
    // if it is, it will look like the code in [./custom_snippets/firestore_add_data_custom_objects_snippet.dart]

    // This is how it's done in some other languages, but this doesn't seem like it should be included,
    // because it isn't really a Firebase feature. I'm just converting Objects into a Map before submitting it.
  }

  void addData_customObjects2() {
    // [START add_data_custom_objects2]
    // TODO: is this supported in Dart yet?
    // in the current docs, it isn't supported for about half the languages
    // See note above before including this in the docs.

    final city = City(
      name: "Los Angeles",
      state: "CA",
      country: "USA",
      capital: false,
      population: 5000000,
      regions: ["west_coast", "socal"],
    );

    db.collection("cities").doc("LA").set(city.toFirestore());
    // [END add_data_custom_objects2]
  }

  void addData_addADocument() {
    // [START add_data_add_a_document ]
    db.collection("cities").doc("new-city-id").set({"name": "Chicago"});
    // [END add_data_add_a_document ]
  }

  void addData_addADocument2() {
    // [START add_data_add_a_document_2 ]
    // Add a new document with a generated id.
    final data = {"name": "Tokyo", "country": "Japan"};

    db.collection("cities").add(data).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
    // [END add_data_add_a_document_2 ]
  }

  void addData_addADocument3() {
    // [START add_data_add_a_document_3 ]
    // Add a new document with a generated id.
    final data = <String, dynamic>{};

    final newCityRef = db.collection("cities").doc();

    // Later...
    newCityRef.set(data);

    // [END add_data_add_a_document_3 ]
  }

  void addData_updateADocument() {
    // [START add_data_update_a_document]
    /*
    val washingtonRef = db.collection("cities").document("DC")

// Set the "isCapital" field of the city 'DC'
washingtonRef
        .update("capital", true)
        .addOnSuccessListener { Log.d(TAG, "DocumentSnapshot successfully updated!") }
        .addOnFailureListener { e -> Log.w(TAG, "Error updating document", e) }
   */

    // [END add_data_update_a_document]
  }
}
