import 'package:flutter/material.dart';
import 'package:second_assingment/data/model/user.dart';
import 'package:second_assingment/presentation/resources/font_manager.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:second_assingment/presentation/resources/values_manager.dart';
import '../../app/constant.dart';
import '../resources/color_manager.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.primary,
          content: Container(
            color: ColorManager.primary,
            height: AppSize.s90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Do you want to exit?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.error),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: AppSize.s15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorManager.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String username = "";
  String phone = "";
  String? email = "";
  Future<void> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token")!;
    // ignore: constant_identifier_names
    const Url = Constant.baseUrl;
    final response = await http.get(
      Uri.parse(Url),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final parse = json.decode(response.body);
      setState(() {
        username = Data.fromJson(parse).user.username;
        phone = Data.fromJson(parse).user.phone;
        email = Data.fromJson(parse).user.email;
      });
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Text(
                'Welcome $username from Home',
                style: const TextStyle(
                    fontSize: FontSize.s20, color: Colors.white),
              ),
              Text(
                'PhoneNumber : $phone',
                style: const TextStyle(
                    fontSize: FontSize.s20, color: Colors.white),
              ),
              Text(
                'EmailAddress : $email',
                style: const TextStyle(
                    fontSize: FontSize.s20, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: AppSize.s200,
                height: AppSize.s50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('LogOut'),
                  onPressed: () {
                    logout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
