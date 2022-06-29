import 'package:flutter/material.dart';

import 'package:yummy_chat/config/palette.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool isSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: Stack(
        children: [
          Positioned(
            top: 0.0, left: 0.0, right: 0.0,
            child: Container(
              height: 296.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/red.jpg'),
                  fit: BoxFit.fill,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 88.0, left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: ' to Yummy chat!',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Signup to continue',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 184.0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: 280.0,
              width: MediaQuery.of(context).size.width - 32,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isSignUp = false),
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: !isSignUp ? Palette.activate
                                  : Palette.deactivate,
                              ),
                            ),
                            if (!isSignUp)
                            Container(
                              height: 2.0,
                              width: 64.0,
                              color: Colors.orange,
                              margin: const EdgeInsets.only(top: 2.0),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => isSignUp = true),
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: isSignUp ? Palette.activate
                                  : Palette.deactivate,
                              ),
                            ),
                            if (isSignUp)
                            Container(
                              height: 2.0,
                              width: 64.0,
                              color: Colors.orange,
                              margin: const EdgeInsets.only(top: 2.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}