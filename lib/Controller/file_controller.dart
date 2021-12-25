import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class FileController extends ChangeNotifier {
  File? image;

  Future<void> pickImage(BuildContext context, ImageSource source) async {
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
    //setState no ko thay doi~, no ko build lai widget, sau khi gop nhanh' voi Vinh thi bi the'
    //chua~ chay' bang` cach' reload lai Page
    (context as Element).reassemble();
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
                onPressed: () => pickImage(context, ImageSource.camera),
                child: Row(
                  children: const [Icon(Icons.camera_enhance), Text("Camera")],
                )),
            TextButton(
                onPressed: () => pickImage(context, ImageSource.gallery),
                child: Row(
                  children: const [Icon(Icons.image), Text("Gallery")],
                )),
          ])
        ],
      ),
    );
  }
}
