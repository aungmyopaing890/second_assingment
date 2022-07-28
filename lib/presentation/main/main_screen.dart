import 'package:flutter/material.dart';
import 'package:second_assingment/presentation/resources/font_manager.dart';
import 'package:second_assingment/presentation/resources/values_manager.dart';
import '../resources/color_manager.dart';
import 'dart:io';

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
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: const Center(
          child: Text(
            'Welcome To Main Screen',
            style: TextStyle(fontSize: FontSize.s20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
