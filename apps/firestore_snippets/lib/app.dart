import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_snippets/snippets/firestore.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.firestore,
  }) : super(key: key);

  final FirebaseFirestore firestore;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FirestoreSnippets _firestoreSnippets;

  @override
  void initState() {
    _firestoreSnippets = FirestoreSnippets(widget.firestore);

    _firestoreSnippets.runAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snippet Test'),
        ),
      ),
    );
  }
}
