import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import '../all_page.dart';

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

  Future<Uint8List> downloadImage() async {
    final url = "http://10.0.2.2:8000/storage/assets/images/avatar/" + Auth.khachHang.hinhAnh!;
    //ten cua file bang chuoi~ duong dan cuoi' cung`
    final filename = Uri.parse(url).pathSegments.last;

    //lay ra duong dan cua ung dung
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');

    if (file.existsSync()) {
      //neu file nay da ton tai
      return await file.readAsBytes();
    } else {
      //nguoc lai download file ve`, luu vo memory

      final request = await http.get(Uri.parse(url)); //gui request len sv, lay hinh` ve`
      //du lieu cua request tra? ve`, luu vo bien'
      final bytes = request.bodyBytes;
      //ghi du lieu
      await file.writeAsBytes(bytes);
      //print(file.path); //duong dan file
      return bytes;
    }
  }
}
