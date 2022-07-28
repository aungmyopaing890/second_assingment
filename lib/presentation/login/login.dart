import 'package:flutter/material.dart';
import 'package:second_assingment/presentation/resources/route_manager.dart';
import 'package:second_assingment/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "PhoneNumer",
                            labelText: "PhoneNumer",
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
                            Navigator.pushReplacementNamed(
                                context, Routes.mainRoute);
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
