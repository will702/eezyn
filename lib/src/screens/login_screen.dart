import "package:flutter/material.dart";
import 'package:new_flutter_template/src/colors_themes/colors.dart';
import 'package:new_flutter_template/src/screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text("Hi user"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Credentials",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.face,
                        color: Colors.white,
                      ),
                      fillColor: Colors.white12,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(16)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.white12,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 200),
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  ScaleTransition(
                                scale: animation,
                                child: SlideTransition(
                                  child: child,
                                  position: Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: const Offset(0, 0))
                                      .animate(animation),
                                ),
                              ),
                              pageBuilder: (context, animation, animationTwo) {
                                return const Homescreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
