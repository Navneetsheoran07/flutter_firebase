import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import '../model/ImageData.dart';

class ImageViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  File? _image;

  File? get image => _image;

  Future<void> pickImage() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      }
    } else {
      // Handle the case where the user denies the permission
      print('Permission denied');
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) return;

    try {
      String fileName = path.basename(_image!.path);
      Reference firebaseStorageRef = _firebaseStorage.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      await uploadTask;

      String downloadURL = await firebaseStorageRef.getDownloadURL();
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      ImageData imageData = ImageData(id: id, imageUrl: downloadURL);

      await _firestore.collection('images').doc(id).set(imageData.toJson());
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}
