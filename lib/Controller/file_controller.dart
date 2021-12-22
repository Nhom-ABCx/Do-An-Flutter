import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FileController extends ChangeNotifier {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final imageeee = await ImagePicker().pickImage(source: source);
      if (imageeee == null) return;

      final imgtemp = File(imageeee.path);
      //setState(() => image = imgtemp);
      image = imgtemp;
    } catch (e) {
      print("Failed to pick image: $e");
    }
    notifyListeners();
  }

  Widget bottomSheetPickImage(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Choose photo",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(
                onPressed: () => pickImage(ImageSource.camera),
                child: Row(
                  children: const [Icon(Icons.camera_enhance), Text("Camera")],
                )),
            TextButton(
                onPressed: () => pickImage(ImageSource.gallery),
                child: Row(
                  children: const [Icon(Icons.image), Text("Gallery")],
                )),
          ])
        ],
      ),
    );
  }
}
