import 'dart:async';

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
  bool _runningTests = false;

  @override
  void initState() {
    _firestoreSnippets = FirestoreSnippets(widget.firestore);

    super.initState();
  }

  startTests() async {
    setState(() {
      _runningTests = true;
    });
    // wait a moment for all boot activity to finish cause the logs are hard to read.
    Timer(
      const Duration(seconds: 5),
      () {
        _firestoreSnippets.runAll();
      },
    );
  }

  testsDone() {
    setState(() {
      _runningTests = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    startTests();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snippet Test'),
        ),
        body: Column(
          children: [
            if (_runningTests)
              const Text(
                "Hol' up. Tests are running...",
                style: TextStyle(fontSize: 36.0),
              ),
            if (_runningTests) const CircularProgressIndicator(),
            if (!_runningTests) const Text("Tests Complete"),
          ],
        ),
      ),
    );
  }
}
