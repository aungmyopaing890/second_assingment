// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:second_assingment/app/constant.dart';
import 'package:second_assingment/data/model/error.dart';
import 'package:second_assingment/data/model/token.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:second_assingment/presentation/resources/values_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> authenticate() async {
    const loginUrl = Constant.baseUrl;
    final body = {
      "username": _userNameController.text,
      "password": _passwordController.text
    };
    final response = await http.post(Uri.parse(loginUrl), body: body);
    final parse = json.decode(response.body);
    if (response.statusCode == 200) {
      final String token = Token.fromJson(parse).accessToken;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
    } else {
      if (response.body.contains('error')) {
        final snackBar = SnackBar(
          content: Text(ApiError.fromJson(parse).error.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response.body.contains('message')) {
        final snackBar = SnackBar(
          content: Text(ApiError.fromJson(parse).message.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  builder: (context, snapshot) {
                    return TextFormField(
                        controller: _userNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintText: "UserName",
                            labelText: "UserName",
                            icon: Icon(
                              Icons.security,
                              color: Colors.black,
                            )));
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          icon: Icon(Icons.lock, color: Colors.black)),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.s28),
              Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder(
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: AppSize.s200,
                        height: AppSize.s50,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          child: const Text('Login'),
                          onPressed: () {
                            authenticate();
                          },
                        ),
                      );
                    },
                  )),
              const SizedBox(height: AppSize.s28),
              const Text(
                'Terms and Condition',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic),
              )
            ],
          )),
        ),
      ),
    );
  }
}
