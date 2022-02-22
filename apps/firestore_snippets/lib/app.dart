import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

late FirebaseFirestore db;

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.firestore,
  }) : super(key: key);

  final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    db = firestore;
    return MaterialApp(
      title: 'Tasty Eats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TastyEatsApp(),
    );
  }
}

class TastyEatsApp extends StatelessWidget {
  const TastyEatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome to Tasty Eats'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          db.collection('restaurants').add({
            "name": "Papa Johns",
          })
        },
      ),
    );
  }
}
