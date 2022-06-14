import 'package:do_an_flutter/Module/login/login_controller.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RxBool isShowPassword = true.obs;
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
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
                  child: Form(
                    key: controller.loginFormKey,
                    child: Obx(
                      () => Column(
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
                            child: TextFormField(
                              decoration: const InputDecoration(
                                //border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                labelText: "Email or Username",
                                hintText: "info@example.com",
                                //errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                prefixIcon: Icon(
                                  Icons.supervisor_account,
                                  color: Colors.white,
                                ),
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              controller: controller.txtUsername, //gan gia tri cua text vao bien'
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(255), //gioi han do dai`
                              ],
                              validator: (value) {
                                if (value!.isEmpty) return 'Email or Username is required.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              right: 20,
                              bottom: 10,
                            ),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  //border: OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  labelText: "Password",
                                  //errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                  prefixIcon: const Icon(Icons.vpn_key, color: Colors.white),
                                  suffixIcon: IconButton(
                                    onPressed: () => isShowPassword.value = !isShowPassword.value,
                                    icon: Icon(
                                      isShowPassword.value ? Icons.visibility : Icons.visibility_off,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  labelStyle: const TextStyle(color: Colors.white),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                ),
                                obscureText: isShowPassword.value, //hien * khi nhap text
                                controller: controller.txtPassword, //gan gia tri cua text vao bien'
                                // keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.go,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(255), //gioi han do dai`
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) return 'Password is required.';
                                  return null;
                                }),
                          ),
                          SizedBox(
                            width: Get.width * 0.7,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                final result = await controller.loginApp(controller.txtUsername.text, controller.txtPassword.text);
                                print(result!.token.toString());
                                if (result.token == "") {
                                } else {
                                  Get.offAllNamed(Routes.Home);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12), // <-- Radius
                                    //side: const BorderSide(color: Colors.pink)
                                  ),
                                  primary: Colors.green
                                  // shadowColor: MaterialStateProperty.all<Color>(Colors.red),
                                  ),
                              child: const Text('Login'),
                            ),
                          ),
                          TextButton(
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            onPressed: () => {},
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
                                onPressed: () => {},
                              ),
                            ],
                          ),
                          TextButton(
                            child: const Text(
                              "VIEW AS GUES",
                              style: TextStyle(fontSize: 17, color: Colors.amber),
                            ),
                            onPressed: () => Get.offAllNamed(Routes.Home),
                          ),
                          _orDivider(context),
                          SizedBox(
                            width: Get.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _SocialIcon(
                                  colors: const [
                                    Color(0xFF102397),
                                    Color(0xFF187adf),
                                    Color(0xFF00eaf8),
                                  ],
                                  iconURL: "assets/svgIcons/facebook.svg",
                                  onPressed: () async {},
                                ),
                                _SocialIcon(
                                  colors: const [
                                    Color(0xFF17ead9),
                                    Color(0xFF6078ea),
                                  ],
                                  iconURL: "assets/svgIcons/twitter.svg",
                                  onPressed: () {
                                    print("twitter");
                                  },
                                ),
                                _SocialIcon(
                                  colors: const [
                                    Color(0xFFff4f38),
                                    Color(0xFFff355d),
                                  ],
                                  iconURL: "assets/svgIcons/google-plus.svg",
                                  onPressed: () async {},
                                ),
                                _SocialIcon(
                                  colors: const [
                                    Color(0xFF00c6fb),
                                    Color(0xFF005bea),
                                  ],
                                  iconURL: "assets/svgIcons/github.svg",
                                  onPressed: () {
                                    print("github");
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: colors)),
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
