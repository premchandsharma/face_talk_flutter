import 'dart:math';
import 'package:face_talk_flutter/components/custom_text_field.dart';
import 'package:face_talk_flutter/screens/call_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userID});

  final String userID;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController joinCode = TextEditingController();

  @override
  void dispose() {
    joinCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'FaceTalk',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CallPage(
                        callID: Random().nextInt(999999).toString().trim(),
                        userID: widget.userID,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 31, 84, 1),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(0, 31, 84, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 48,
                        color: Colors.white,
                      ),
                      Text(
                        '  Create a new call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (joinCode.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter the code.'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CallPage(
                                    callID: joinCode.text.trim(),
                                    userID: widget.userID,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Join',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            hintText: 'Enter the code',
                            textEditingController: joinCode,
                          )
                        ],
                      ),
                      // contentPadding: EdgeInsets.all(5),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 31, 84, 1),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(0, 31, 84, 1),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.photo_camera_rounded,
                        size: 38,
                        color: Colors.white,
                      ),
                      Text(
                        '   Join with a code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
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
