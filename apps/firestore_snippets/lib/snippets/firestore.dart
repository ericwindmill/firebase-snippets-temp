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
    final washingtonRef = db.collection("cites").doc("DC");
    washingtonRef.update({"capital": true}).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
    // [END add_data_update_a_document]
  }

  void addData_serverTimestamp() {
    // [START add_data_server_timestamp]
    final docRef = db.collection("objects").doc("some-id");
    final updates = <String, dynamic>{
      "timestamp": FieldValue.serverTimestamp(),
    };

    docRef.update(updates).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
    // [END add_data_server_timestamp]
  }

  void addData_updateFieldsInNestedObjects() {
    // [START add_data_update_fields_in_nested_objects]
    // Assume the document contains:
    // {
    //   name: "Frank",
    //   favorites: { food: "Pizza", color: "Blue", subject: "recess" }
    //   age: 12
    // }
    db
        .collection("users")
        .doc("frank")
        .update({"age": 13, "favorites.color": "Red"});
    // [END add_data_update_fields_in_nested_objects]
  }

  void addData_updateElementsInArray() {
    // [START add_data_update_elements_in_array]
    final washingtonRef = db.collection("cities").doc("DC");

    // Atomically add a new region to the "regions" array field.
    washingtonRef.update({
      "regions": FieldValue.arrayUnion(["greater_virginia"]),
    });

    // Atomically remove a region from the "regions" array field.
    washingtonRef.update({
      "regions": FieldValue.arrayRemove(["east_coast"]),
    });
    // [END add_data_update_elements_in_array]
  }

  void addData_incrementANumericValue() {
    // [START add_data_increment_a_numeric_value]
    var washingtonRef = db.collection('cities').doc('DC');

    // Atomically increment the population of the city by 50.
    washingtonRef.update(
      {"population": FieldValue.increment(50)},
    );
    // [END add_data_increment_a_numeric_value]
  }

  void transactions_updatingDataWithTransactions() {
    // [START transactions_updating_data_with_transactions]
    final sfDocRef = db.collection("cities").doc("SF");
    db.runTransaction((transaction) async {
      final snapshot = await transaction.get(sfDocRef);
      // Note: this could be done without a transaction
      //       by updating the population using FieldValue.increment()
      final newPopulation = snapshot.get("population") + 1;
      transaction.update(sfDocRef, {"population": newPopulation});
    }).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"),
    );
    // [END transactions_updating_data_with_transactions]
  }

  void transactions_passingInformationOutOfTransactions() {
    // [START transactions_passing_information_out_of_transactions]

    // TODO: ewindmill@ - either the above example (using asnyc) or this example
    // using (then) is "more correct". Figure out which one.
    final sfDocRef = db.collection("cities").doc("SF");
    db.runTransaction((transaction) {
      return transaction.get(sfDocRef).then((sfDoc) {
        final newPopulation = sfDoc.get("population") + 1;
        transaction.update(sfDocRef, {"population": newPopulation});
        return newPopulation;
      });
    }).then(
      (newPopulation) => print("Population increased to $newPopulation"),
      onError: (e) => print("Error updating document $e"),
    );
    // [END transactions_passing_information_out_of_transactions]
  }

  void transactions_batchedWrites() {
    // [START transactions_batched_writes]
    /*






// Commit the batch
batch.commit().then(() => {
    // ...
});
   */
    // Get a new write batch
    final batch = db.batch();

    // Set the value of 'NYC'
    var nycRef = db.collection("cities").doc("NYC");
    batch.set(nycRef, {"name": "New York City"});

    // Update the population of 'SF'
    var sfRef = db.collection("cities").doc("SF");
    batch.update(sfRef, {"population": 1000000});

    // Delete the city 'LA'
    var laRef = db.collection("cities").doc("LA");
    batch.delete(laRef);

    // Commit the batch
    batch.commit().then((_) {
      // ...
    });
    // [END transactions_batched_writes]
  }

  void deleteData_deleteDocs() {
    // [START delete_data_delete_docs]
    db.collection("cities").doc("DC").delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
    // [END delete_data_delete_docs]
  }

  void deleteData_deleteFields() {
    // [START delete_data_delete_fields]
    final docRef = db.collection("cities").doc("BJ");

    // Remove the 'capital' field from the document
    final updates = <String, dynamic>{
      "capital": FieldValue.delete(),
    };

    docRef.update(updates);
    // [END delete_data_delete_fields]
  }

  void getDataOnce_exampleData() {
    // [START get_data_once_example_data]
    final cities = db.collection("cities");
    final data1 = <String, dynamic>{
      "name": "San Francisco",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 860000,
      "regions": ["west_coast", "norcal"]
    };
    cities.doc("SF").set(data1);

    final data2 = <String, dynamic>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA",
      "capital": false,
      "population": 3900000,
      "regions": ["west_coast", "socal"],
    };
    cities.doc("LA").set(data2);

    final data3 = <String, dynamic>{
      "name": "Washington D.C.",
      "state": null,
      "country": "USA",
      "capital": true,
      "population": 680000,
      "regions": ["east_coast"]
    };
    cities.doc("DC").set(data3);

    final data4 = <String, dynamic>{
      "name": "Tokyo",
      "state": null,
      "country": "Japan",
      "capital": true,
      "population": 9000000,
      "regions": ["kanto", "honshu"]
    };
    cities.doc("TOK").set(data4);

    final data5 = <String, dynamic>{
      "name": "Beijing",
      "state": null,
      "country": "China",
      "capital": true,
      "population": 21500000,
      "regions": ["jingjinji", "hebei"],
    };
    cities.doc("BJ").set(data5);
    // [END get_data_once_example_data]
  }

  void getDataOnce_getADocument() {
    // [START get_data_once_get_a_document]
    final docRef = db.collection("cities").doc("SF");
    docRef.get().then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
    // [END get_data_once_get_a_document]
  }

  void getDataOnce_sourceOptions() {
    // [START get_data_once_source_options]
    final docRef = db.collection("cities").doc("SF");

    // Source can be CACHE, SERVER, or DEFAULT.
    const source = Source.cache;

    docRef.get(const GetOptions(source: source)).then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
    // [END get_data_once_source_options]
  }

  void getDataOnce_customObjects() {
    // [START get_data_once_custom_objects]
    // TODO: should this be included?
    // This isn't really specific to Firestore, it's just serdes
    final docRef = db.collection("cities").doc("BJ");
    docRef.get().then((documentSnapshot) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      final city = City(
        name: data['name'],
      );
    });
    // [END get_data_once_custom_objects]
  }

  void getDataOnce_multipleDocumentsFromACollection() {
    // [START get_data_once_multiple_documents_from_a_collection]
    db.collection("cities").where("capital", isEqualTo: true).get().then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
    // [END get_data_once_multiple_documents_from_a_collection]
  }

  void getDataOnce_getAllDocumentsInACollection() {
    // [START get_data_once_get_all_documents_in_a_collection]
    db.collection("cities").get().then(
          (res) => print("Successfully completed"),
          onError: (e) => print("Error completing: $e"),
        );
    // [END get_data_once_get_all_documents_in_a_collection]
  }

  void getDataOnce_listSubCollections() {
    // [START get_data_once_list_sub_collections]
    // Not currently available in Dart SDK
    // [END get_data_once_list_sub_collections]
  }

  void listenToRealtimeUpdates_listenForUpdates() {
    // [START listen_to_realtime_updates_listen_for_updates]
    final docRef = db.collection("cities").doc("SF");
    docRef.snapshots().listen(
          (event) => print("current data: ${event.data()}"),
          onError: (error) => print("Listen failed: $error"),
        );

    // [END listen_to_realtime_updates_listen_for_updates]
  }

  void listenToRealtimeUpdates_eventsForLocalChanges() {
    // [START listen_to_realtime_updates_events_for_local_changes]
    final docRef = db.collection("cities").doc("SF");
    docRef.snapshots().listen(
      (event) {
        final source = (event.metadata.hasPendingWrites) ? "Local" : "Server";
        print("$source data: ${event.data()}");
      },
      onError: (error) => print("Listen failed: $error"),
    );

    // [END listen_to_realtime_updates_events_for_local_changes]
  }

  void listenToRealtimeUpdates_eventsOnMetadataChanges() {
    // [START listen_to_realtime_updates_events_on_metadata_changes]
    final docRef = db.collection("cities").doc("SF");
    docRef.snapshots(includeMetadataChanges: true).listen((event) {
      // ...
    });
    // [END listen_to_realtime_updates_events_on_metadata_changes]
  }

  void listenToRealtimeUpdates_listToMultipleDocuments() {
    // [START listen_to_realtime_updates_list_to_multiple_documents]
    db
        .collection("Cities")
        .where("state", isEqualTo: "CA")
        .snapshots()
        .listen((event) {
      final cities = [];
      for (var doc in event.docs) {
        cities.add(doc.data()["name"]);
      }
      print("Cities in CA: ${cities.join(", ")}");
    });
    // [END listen_to_realtime_updates_list_to_multiple_documents]
  }

  void listenToRealtimeUpdates_viewUpdatesBetweenChanges() {
    // [START listen_to_realtime_updates_view_updates_between_changes]
    db
        .collection("Cities")
        .where("state", isEqualTo: "CA")
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            print("New City: ${change.doc.data()}");
            break;
          case DocumentChangeType.modified:
            print("Modified City: ${change.doc.data()}");
            break;
          case DocumentChangeType.removed:
            print("Removed City: ${change.doc.data()}");
            break;
        }
      }
    });
    // [END listen_to_realtime_updates_view_updates_between_changes]
  }

  void listenToRealtimeUpdates_detachAListener() {
    // [START listen_to_realtime_updates_detach_a_listener]
    final collection = db.collection("cities");
    final listener = collection.snapshots().listen((event) {
      // ...
    });
    listener.cancel();
    // [END listen_to_realtime_updates_detach_a_listener]
  }

  void listenToRealtimeUpdates_handleListenErrors() {
    // [START listen_to_realtime_updates_handle_listen_errors]
    final docRef = db.collection("cities");
    docRef.snapshots().listen(
          (event) => print("listener attached"),
          onError: (error) => print("Listen failed: $error"),
        );
    // [END listen_to_realtime_updates_handle_listen_errors]
  }
}
