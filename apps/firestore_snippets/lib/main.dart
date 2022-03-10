// [START set_up_environment]
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// [END set_up_environment]

import 'package:firestore_snippets/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  // TODO: special-case -- be sure to document
// [START get_firestore_instance]

  /// In the Firebase documentation, the code should look like the following example
  /// In this snippets app, we're using the FlutterFire CLI to generate FirebaseOptions
  ///```dart
  /// WidgetsFlutterBinding.ensureInitialized();
  /// await Firebase.initializeApp(
  ///   options: const FirebaseOptions(
  ///     apiKey: '### FIREBASE API KEY ###',
  ///     authDomain: '### FIREBASE AUTH DOMAIN ###',
  ///     projectId: '### CLOUD FIRESTORE PROJECT ID ###'
  ///   )
  /// );
  /// final firestore = FirebaseFirestore.instance;
  /// ```

// [END get_firestore_instance]

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final db = FirebaseFirestore.instance;
  // TODO: special-case -- be sure to document

  // [START access_data_offline_configure_offline_persistence]
  final settings = db.settings.copyWith(persistenceEnabled: true);
  // [END access_data_offline_configure_offline_persistence]

  // [START access_data_offline_configure_offline_persistence]
  final updatedSettings =
      db.settings.copyWith(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  db.settings = updatedSettings;
  // [END access_data_offline_configure_offline_persistence]

  if (!kReleaseMode) db.useFirestoreEmulator('localhost', 8080);

  runApp(
    MyApp(firestore: db),
  );
}
