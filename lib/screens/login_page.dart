import 'package:face_talk_flutter/components/custom_text_field.dart';
import 'package:face_talk_flutter/screens/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'FaceTalk',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              CustomTextField(
                hintText: 'Enter your name',
                textEditingController: nameController,
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              // CustomTextField(
              //   hintText: 'Enter your password',
              //   textEditingController: passwordController,
              // ),
              const SizedBox(
                height: 28,
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter your phone number.',
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(userID: nameController.text.trim()),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 31, 84, 1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
                ),
                child: const Text(
                  'Enter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
