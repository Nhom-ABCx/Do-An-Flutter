import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modals/message.dart';
import 'package:flutter_application_1/all_page.dart';

const String _name = "Hanh Vu";

//code layout tham khao tu` google https://viblo.asia/p/flutter-viet-ung-dung-chat-voi-flutter-p1-GrLZD8GOZk0
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false; //dang nhap chu~=false
  late ScrollController _controller; //ko biet'

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      //"reach the bottom"
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      // "reach the top";
      setState(() {});
    }
  }

  Widget _buildTextInput() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          //duong vien`cua textbox
          border: Border.all(width: 1.0, color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  //neu' co' du lieu trong text thi` nut gui~ se~ dc hien
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                keyboardType: TextInputType.multiline, //co the dc nhieu` dong`
                maxLines: 10, //do dai` toi' da =10
                minLines: 1,
                decoration: const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            //neu' textfield ko rong~ thi` dc phep nhan' nut, ngc lai thi` nhan' ko dc
            IconButton(icon: const Icon(Icons.send), onPressed: _isComposing ? () => _handleSubmitted(_textController.text) : null),
          ],
        ),
      );

  Widget _buildTextComposer() {
    //bottom chat Text o duoi man hinh`
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(icon: const Icon(Icons.photo_camera), onPressed: () {}),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(icon: const Icon(Icons.photo_library), onPressed: () {}),
          ),
          Expanded(
            child: _buildTextInput(),
          ),
        ],
      ),
    );
  }

  //ham` khi nhan' gui~
  void _handleSubmitted(String text) {
    //textField sẽ clear chu~
    _textController.clear();
    //dat lai trang thai' dang soan =false
    setState(() => _isComposing = false);
    if (text.isNotEmpty) {
      //neu' textField ko rong~ thi` tao 1 widget tin nhan' moi'
      ChatMessage message = ChatMessage(
        text: text, //noi dung tin nhan'
        //chuyen dong tin nhan' khi gui~
        animationController: AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        ),
      );
      //them vao` danh sach tin nhan' o phan tu? dau` tien
      setState(() => _messages.insert(0, message));
      //bat dau`animation chay chu~ khi gui~ tin nhan' len
      message.animationController.forward();
    }
  }

  @override //new
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(iconTheme: const IconThemeData(color: Colors.indigo), title: const Text('Chat with $_name', style: TextStyle(color: Colors.indigo))),
      body: Column(
        children: [
          Flexible(
            // Flexible dua theo widget, size cua thiet bi ma` thay doi?
            child: ListView.builder(
              controller: _controller,
              padding: const EdgeInsets.all(8.0),
              reverse: true, //tu duoi' len
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          // Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: SafeArea(
              bottom: true,
              //bottom chat Text o duoi man hinh`
              child: _buildTextComposer(),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.text, required this.animationController}) : super(key: key);
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      //SizeTransition la` animation chuyen? dong
      //sizeFactor nhu kieu khai bao'
      sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      //axisAlignment: 1.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])), //hinh anh avt
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(_name), //ten
                Container(
                  width: MediaQuery.of(context).size.width / (1.3),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text), //noi dung chat
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
