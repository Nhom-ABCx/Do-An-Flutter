import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  AppBarPage({Key? key}) : super(key: key);
  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.indigo),
      title: SizedBox(
        width: 250,
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your keyword",
            prefixIcon: Icon(Icons.search),
          ),
          controller: txtTimKiem, //gan gia tri cua text vao bien'
          textInputAction: TextInputAction.search,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(50), //gioi han do dai`
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
