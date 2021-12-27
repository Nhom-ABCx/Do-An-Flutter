import 'package:flutter/material.dart';
import '/all_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBar(
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: true,
          ),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: ListView.separated(
            physics:const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 35,
            itemBuilder: (context, index) {
              return const BodyNotifications();
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}

class BodyNotifications extends StatelessWidget {
  const BodyNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover)),
      ),
      title: const Text(
        'E-EEEE',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: const Text(
        'timeee',
        style: TextStyle(
          color: Colors.black45,
          fontSize: 15,
        ),
      ),
      onTap: () {},
      enabled: true,
    );
  }
}
