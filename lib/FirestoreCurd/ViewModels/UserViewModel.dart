import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/MyData.dart';


class MyDataViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(MyData data) async {
    try {
      await _firestore.collection('myDataCollection').doc(data.id).set(data.toJson());
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  Future<void> updateData(MyData data) async {
    try {
      await _firestore.collection('myDataCollection').doc(data.id).update(data.toJson());
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await _firestore.collection('myDataCollection').doc(id).delete();
    } catch (e) {
      print("Error deleting data: $e");
    }
  }
}

