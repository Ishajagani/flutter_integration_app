import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageFileScreen extends StatefulWidget {
  const ImageFileScreen({Key? key}) : super(key: key);

  @override
  State<ImageFileScreen> createState() => _ImageFileScreenState();
}

class _ImageFileScreenState extends State<ImageFileScreen> {
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  var dataPath = "assets/images/privacy.png";
  String dataUrl = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';
  XFile? images;

  setFile() async {
    try {
      Reference ref = storage.ref();
      Reference imageRef = ref.child("image/${images!.name}");
      File image = File(images!.path);
      await imageRef.putFile(image);
      String url = await imageRef.getDownloadURL();
      debugPrint("FileUrl ---->$url");
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  setString() async {
    Reference ref = storage.ref();

    Reference dataRef = ref.child("String(URL)/$dataUrl");

    await dataRef.putString(dataUrl, format: PutStringFormat.dataUrl);
  }

  setData() async {
    try {
      ByteData bytes = await rootBundle.load(dataPath);
      Reference ref = storage.ref();
      Reference dataString = ref.child(dataPath);
      Uint8List rawData =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await dataString.putData(rawData);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  downloadData() async {
    try {
      debugPrint(" print-->  ${images!.name}");
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = "${appDocDir.absolute}assets/images/privacy.png";
      File file = File(filePath);
      Reference ref = storage.ref();

      Reference imageRef = ref.child("image/${images!.name}");
      String url = await imageRef.getDownloadURL();
      debugPrint("DownloadUrl ---> $url");

      await imageRef.writeToFile(file);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteFile() async {
    try {
      Reference ref = storage.ref();

      Reference imageRef = ref.child("image/${images!.name}");

      await imageRef.delete();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload File',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                images = await picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Container(
                height: 210,
                width: 210,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  shape: BoxShape.circle,
                ),
                child: images != null
                    ? Image.file(
                        File(images!.path),
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.camera_alt_outlined, size: 90),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF))),
              onPressed: () {
                setFile();
              },
              child: const Text('Upload image',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF))),
              onPressed: () {
                setString();
              },
              child: const Text('Upload string',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF))),
              onPressed: () {
                setData();
              },
              child: const Text('Upload data',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF))),
              onPressed: () {
                deleteFile();
              },
              child: const Text('Image delete',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF))),
              onPressed: () {
                downloadData();
              },
              child: const Text('Download File',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
