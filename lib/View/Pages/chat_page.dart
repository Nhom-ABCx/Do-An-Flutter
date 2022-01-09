import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modals/message.dart';
import 'package:flutter_application_1/all_page.dart';
import 'package:provider/provider.dart';

//code layout tham khao tu` google https://viblo.asia/p/flutter-viet-ung-dung-chat-voi-flutter-p1-GrLZD8GOZk0
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false; //dang nhap chu~=false
  late ScrollController _controller; //ko biet'

  @override
  void dispose() {
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
                  if (!_isComposing) setState(() => _isComposing = text.isNotEmpty);
                  if (text.isEmpty) setState(() => _isComposing = false);
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
  void _handleSubmitted(String text) async {
    //textField sẽ clear chu~
    _textController.clear();
    //dat lai trang thai' dang soan =false
    setState(() => _isComposing = false);
    if (text.isNotEmpty) {
      //neu' textField ko rong~ thi` tao 1 widget tin nhan' moi'
      final mess = Message(khachHangId: Auth.khachHang.id, body: text);
      //them vao` danh sach tin nhan' o phan tu? dau` tien
      final sucssess = await Provider.of<MessageController>(context, listen: false).addData(mess);
      if (sucssess)
        print("Them thanh cong");
      else
        print("Them that bai");
    }
  }

  @override //new
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(iconTheme: const IconThemeData(color: Colors.indigo), title: const Text('Chat with ADMIN', style: TextStyle(color: Colors.indigo))),
      body: Column(
        children: [
          Flexible(
            // Flexible dua theo widget, size cua thiet bi ma` thay doi?
            child: FutureBuilder<List<Message>>(
                future: Provider.of<MessageController>(context, listen: false).getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return snapshot.hasData
                      ? ListView.builder(
                          controller: _controller,
                          padding: const EdgeInsets.all(8.0),
                          reverse: true, //tu duoi' len
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => ChatMessage(message: snapshot.data![index]),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
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
  final Message message;
  const ChatMessage({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //neu la` khach hang nhan'
    if (message.khachHangId != null) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / (1.5)),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Colors.blue),
            child: Text(message.body!, style: const TextStyle(color: Colors.white))), //noi dung chat
      );
    }
    //neu la admin nhan'
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(child: Text("A")), //hinh anh avt
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Admin"), //ten
              Container(
                //width: MediaQuery.of(context).size.width / (1.3),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / (1.3)),
                margin: const EdgeInsets.only(top: 5.0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(30)), color: Colors.grey.withOpacity(0.4)),
                child: Text(message.body!), //noi dung chat
              ),
            ],
          ),
        ],
      ),
    );
  }
}
