import 'package:athena_hour_tracker_app/Screens/Main-Menu/main_menu_page.dart';
import 'package:athena_hour_tracker_app/Screens/Widgets/RoundedButtonWidget.dart';
import 'package:athena_hour_tracker_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:athena_hour_tracker_app/Screens/Login/Components/login_background_widget.dart';
import 'package:flutter_svg/svg.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  _LoginBodyWidgetState createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: LoginBackgroundWidget(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          const Text(
            "WELCOME TO ATHENA",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SvgPicture.asset(
            "assets/icons/Login.svg",
            height: size.height * 0.3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29)),
            child: TextFormField(
              controller: _nameController,
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },*/
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                hintText: "Username",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29)),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },*/
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                ),
                hintText: "Password",
                border: InputBorder.none,
              ),
            ),
          ),
          RoundedButtonWidget(
              text: "LOGIN",
              press: (checkLogin),
              color: kPrimaryColor,
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Forgot password? ",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print("Tapped");
                  },
                  child: const Text(
                    "Recover",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ))
            ],
          ),
        ]),
      ),
    );
  }

  void checkLogin() {
    Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MainMenuPage()));
    print("Pressed");
  }
}

