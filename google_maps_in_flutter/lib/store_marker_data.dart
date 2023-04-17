import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:native_exif/native_exif.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class ImageHandler {

  Future<String?> getLocationDataFromImage(String filePath) async {
    String preciseLocation;
    final exif = await Exif.fromPath(filePath);
    final latLong = await exif.getLatLong();
    await exif.close();
    if (latLong != null) {
      preciseLocation = latLong.latitude.toString() + "," + latLong.longitude.toString();
      return preciseLocation;
    }
    return null;
  }
}

class CameraDemo extends StatefulWidget {
  const CameraDemo({Key? key}) : super(key: key);

  @override
  State<CameraDemo> createState() => CameraDemoState();
}

class CameraDemoState extends State<CameraDemo> {
  File? image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveFile(image.path);

      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Image displayImage() {
    return image != null
        ? Image.file(image!, height: 300)
        : Image.network(
        'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        height: 300);
  }

  Future<File> saveFile(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Demo'),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          children: [
            displayImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton(
                    title: 'Camera',
                    icon: Icons.camera_alt_outlined,
                    onClick: () => getImage(ImageSource.camera)),
                const SizedBox(width: 5.0),
                customButton(
                    title: 'Gallery',
                    icon: Icons.image_outlined,
                    onClick: () => getImage(ImageSource.gallery))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget customButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 110,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
      child: Row(
        children: [Icon(icon), const SizedBox(width: 5.0), Text(title)],
      ),
    ),
  );
>>>>>>> 7f4526decd44b6dbc459ec5ceb5d58d374d5388c
}