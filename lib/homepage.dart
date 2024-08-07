import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pro/pixel_perfect.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final TextEditingController emailcontrioller;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              width: 400.0,
              child: TextFormField(
                controller: passcontroller,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                log(emailcontroller.text.toString());

                if (emailcontroller.text.toString() == 'muskan@pro.com' &&
                    passcontroller.text.toString() == '9056594660') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PixelPerfect()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Invalid Email or Password'),
                  ));
                }

                emailcontroller.clear();
                passcontroller.clear();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 8.0,
                ),
                child: Text("Login"),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: CustomRadioButtons(),
            // ),
          ],
        ),
      ),
    );
  }
}
