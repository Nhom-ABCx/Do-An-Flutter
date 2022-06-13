// import 'package:get/get.dart';

part of 'container_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

class _CartPageState extends State<CartPage> {
  bool _value = false;

  /* build sản phẩm giỏ hàng */
  Widget buildProductCart() => Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0xFFBDE1EC),
                  offset: Offset(0, 1.0),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Row(
                children: [
                  Checkbox(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = true;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/dt.png',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        '7.999.000 đ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Iphone13 Promax 128 Gb'),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Text('Màu: '),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 200,
            bottom: 20,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: 35,
                      height: 35,
                      child: const Align(
                        child: Text(
                          '-',
                          style: style,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('1'),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: 35,
                      height: 35,
                      // color: Colors.white,
                      child: const Align(
                        child: Text(
                          '+',
                          style: style,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_shopping_cart,
                size: 35,
              ),
              color: Colors.red,
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                snap: true,
                floating: true,
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 35,
                      color: Colors.black,
                    )),
                automaticallyImplyLeading: false,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  BaseTranslation.Cart.tr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: [0, 3],
                      colors: [Color.fromARGB(148, 203, 171, 95), Color.fromARGB(255, 9, 169, 89)],
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              )
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          bottomNavigationBar: Material(
            child: Container(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.black54),
              ),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Tổng tiền(tạm tính):',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        '7.999.000 đ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.red),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, top: 20),
                        width: 300,
                        decoration: BoxDecoration(
                          // shape: StadiumBorder(),
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
                          // borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                              // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.transparent,
                              shadowColor: Colors.white,
                              elevation: 0,
                            ),
                            child: SizedBox(
                              // width: 150,
                              // height: 25,
                              child: Center(
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (rect) =>
                                      const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.white, Colors.white])
                                          .createShader(rect),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Thanh toán',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
