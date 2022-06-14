import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperWidget {
  static void showToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0);
  //show input

  static void showDialogInput({
    required BuildContext context,
    required ValueSetter<String> whenSubmit,
    String? title,
    String? labelText,
    String? hintText,
    String? Function(String)? validator,
    bool isInputNumber = false,
    String? defaultTextInput,
  }) async {
    final _formKey = GlobalKey<FormState>(); //tao 1 cai form de validate
    final txtController = TextEditingController(text: defaultTextInput);
    final result = await showDialog<String>(
        //barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: title != null ? Text(title) : null,
              content: Form(
                  key: _formKey,
                  child: TextFormField(
                    onTap: () =>
                        //focus all text
                        txtController.selection = TextSelection(baseOffset: 0, extentOffset: txtController.text.length),
                    autofocus: true,
                    controller: txtController, //gan gia tri cua text vao bien'
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.cloud_circle),
                      border: const UnderlineInputBorder(),
                      labelText: labelText,
                      hintText: hintText,
                    ),
                    inputFormatters: isInputNumber
                        ? <TextInputFormatter>[
                            //only number
                            FilteringTextInputFormatter.digitsOnly
                          ]
                        : null,
                    keyboardType: isInputNumber ? TextInputType.phone : null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Not empty !";
                      }
                      return validator != null ? validator(value) : null;
                    },
                  )),
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      //neu' du lieu nhap dung'
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop<String>(txtController.text);
                      }
                    },
                    child: const Text("Add"),
                  ),
                )
              ],
            ));

    //xu ly'
    if (result != null) {
      whenSubmit(result);
    }
  }
}
