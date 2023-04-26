import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  
  Future uploadImage(File file, String name) async {
    final imageRef = storageRef.child(name);
    final imagePathRef = storageRef.child('map_images/$name');

    try {
      // Upload raw data.
    	await imageRef.putFile(file);
      } on firebase_core.FirebaseException catch (e) {
      print('no');
    }

  }
}