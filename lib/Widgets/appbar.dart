import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/all_page.dart';

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
          ),
          controller: txtTimKiem, //gan gia tri cua text vao bien'
          textInputAction: TextInputAction.search,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(50), //gioi han do dai`
          ],
        ),
      ),
      centerTitle: true,
<<<<<<< HEAD
      actions: [
       IconButton(onPressed:  (){
         if(txtTimKiem.text.isNotEmpty){
           Navigator.push(context,MaterialPageRoute(
             builder: (context)=>SearchPage(tenTimKiem: txtTimKiem.text),
           ));
         }
       }, icon: const Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
      ],
=======
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))],
>>>>>>> 9df0160887af07863e8f392035e66a77db60374a
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// class DeactivatableButton extends StatelessWidget {
//   const DeactivatableButton({
//     Key? key,
//     required this.child,
//     required this.isDeactivated,
//   }) : super(key: key);
//   final MaterialButton child;
//   final bool isDeactivated;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: isDeactivated ? null : child.onPressed,
//       onLongPress: isDeactivated ? null : child.onLongPress,
//       onHighlightChanged: child.onHighlightChanged,
//       textTheme: child.textTheme,
//       textColor: child.textColor,
//       disabledTextColor: child.disabledTextColor,
//       color: child.color,
//       disabledColor: child.disabledColor,
//       focusColor: child.focusColor,
//       hoverColor: child.hoverColor,
//       highlightColor: child.highlightColor,
//       splashColor: child.splashColor,
//       colorBrightness: child.colorBrightness,
//       elevation: child.elevation,
//       focusElevation: child.focusElevation,
//       hoverElevation: child.hoverElevation,
//       highlightElevation: child.highlightElevation,
//       disabledElevation: child.disabledElevation,
//       padding: child.padding,
//       visualDensity: child.visualDensity,
//       shape: child.shape,
//       clipBehavior: child.clipBehavior,
//       focusNode: child.focusNode,
//       autofocus: child.autofocus,
//       materialTapTargetSize: child.materialTapTargetSize,
//       animationDuration: child.animationDuration,
//       minWidth: child.minWidth,
//       height: child.height,
//       enableFeedback: child.enableFeedback,
//       child: child.child,
//     );
//   }
// }
