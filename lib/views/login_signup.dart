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
                      text: TextSpan(
                        text: 'Welcome',
                        style: const TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: isSignUp ? ' to Yummy chat!' : ' Back!',
                            style: const TextStyle(
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
                    Text(
                      isSignUp ? 'Sign up to continue' : 'Sign in to continue',
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 184.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(20.0),
              height: isSignUp ? 292.0 : 260.0,
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
                                color: !isSignUp ? Palette.focusedText
                                  : Palette.lightText,
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
                                color: isSignUp ? Palette.focusedText
                                  : Palette.lightText,
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
                  if (isSignUp)
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              hintText: 'User name',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Palette.lightText,
                              ),
                              contentPadding: EdgeInsets.all(12.0),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Palette.icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              hintText: 'e-mail',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Palette.lightText,
                              ),
                              contentPadding: EdgeInsets.all(12.0),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Palette.icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Palette.lightText,
                              ),
                              contentPadding: EdgeInsets.all(12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isSignUp)
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Palette.icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              hintText: 'User name',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Palette.lightText,
                              ),
                              contentPadding: EdgeInsets.all(12.0),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Palette.icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palette.lightText,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(36.0)
                                ),
                              ),
                              hintText: 'password',
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Palette.lightText,
                              ),
                              contentPadding: EdgeInsets.all(12.0),
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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignUp ? 438.0 : 408.0,
            left: 0.0, right: 0.0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                        offset: const Offset(0.0, 1.0),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 128,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
                Text(isSignUp ? 'or sign up with' : 'or sign in with'),
                const SizedBox(height: 16.0),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: const Size(152.0, 36.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Palette.google,
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Google'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
