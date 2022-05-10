import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool notShowPassword = true;
  final txtEmail = TextEditingController(text: "Khach02");
  final txtPassword = TextEditingController(text: "password123");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: Colors.white), // nhập text chữ trắng
          ),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                  decoration: const BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.cover, image: NetworkImage('https://i.pinimg.com/originals/c2/47/e9/c247e913a0214313045a8a5c39f8522b.jpg')),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.8, 0.9],
                  colors: [
                    //xin cai nen` tu` google
                    Color(0xFF3594DD),
                    Color(0xFF4563DB),
                    Color(0xFF5036D5),
                    Color(0xFF5B16D0),
                  ],
                ),
              )),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // RotationTransition(
                      //   turns: animation_rotation,
                      //   child: Stack(
                      //     children: [
                      //       Image.asset('images/logo/logo-white.png'),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 30,
                          right: 20,
                          bottom: 10,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            //border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            labelText: "Email or Username",
                            hintText: "info@example.com",
                            //errorText: snapshot.hasError ? snapshot.error.toString() : null,
                            prefixIcon: const Icon(
                              Icons.supervisor_account,
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                          controller: txtEmail, //gan gia tri cua text vao bien'
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(255), //gioi han do dai`
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            TextField(
                              obscureText: notShowPassword, //hien * khi nhap text
                              decoration: InputDecoration(
                                //border: OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "Password",
                                //errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                prefixIcon: const Icon(
                                  Icons.vpn_key,
                                  color: Colors.white,
                                ),
                                labelStyle: const TextStyle(color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              controller: txtPassword, //gan gia tri cua text vao bien'
                              textInputAction: TextInputAction.go,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(255), //gioi han do dai`
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () => setState(() => notShowPassword = !notShowPassword),
                                child: notShowPassword
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        width: 300,
                        child: TextButton(
                          child: const Text('Log In', style: TextStyle(fontSize: 20, color: Colors.white)),
                          onPressed: () async {},
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/Forgot'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't have an account?",
                            style: TextStyle(fontSize: 15, color: Colors.grey[300]),
                          ),
                          TextButton(
                            child: const Text(
                              "Register Now",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            onPressed: () => Navigator.pushNamed(context, '/Sign_Up'),
                          ),
                        ],
                      ),
                      TextButton(
                        child: const Text(
                          "VIEW AS GUES",
                          style: TextStyle(fontSize: 17, color: Colors.amber),
                        ),
                        onPressed: () => Navigator.pushReplacementNamed(context, '/Home'),
                      ),
                      _orDivider(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(
                            colors: const [
                              Color(0xFF102397),
                              Color(0xFF187adf),
                              Color(0xFF00eaf8),
                            ],
                            iconURL: "assets/icons/facebook.svg",
                            onPressed: () async {},
                          ),
                          _SocialIcon(
                            colors: const [
                              Color(0xFF17ead9),
                              Color(0xFF6078ea),
                            ],
                            iconURL: "assets/icons/twitter.svg",
                            onPressed: () {
                              print("twitter");
                            },
                          ),
                          _SocialIcon(
                            colors: const [
                              Color(0xFFff4f38),
                              Color(0xFFff355d),
                            ],
                            iconURL: "assets/icons/google-plus.svg",
                            onPressed: () async {},
                          ),
                          _SocialIcon(
                            colors: const [
                              Color(0xFF00c6fb),
                              Color(0xFF005bea),
                            ],
                            iconURL: "assets/icons/github.svg",
                            onPressed: () {
                              print("github");
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final String iconURL;
  final void Function() onPressed;
  const _SocialIcon({Key? key, required this.colors, required this.iconURL, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp)),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: SvgPicture.asset(
            iconURL,
            height: 25,
            width: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget _orDivider(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
    width: size.width * 0.8,
    child: Row(
      children: const [
        Expanded(
          //Divider la ke~ lan`
          child: Divider(
            color: Colors.white,
            height: 1.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          //Divider la ke~ lan`
          child: Divider(
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}
