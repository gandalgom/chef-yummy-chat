import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../config/color_palette.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isSignUp = true;
  bool isConnecting = false;

  final _formKey = GlobalKey<FormState>();

  void _checkValidation() {
    bool? isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      _formKey.currentState?.save();
    }
  }

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  final _authentication = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: ModalProgressHUD(
        inAsyncCall: isConnecting,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 24.0),
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
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(1),
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
                                  onChanged: (value) {
                                    userName = value;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      userName = value;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  key: const ValueKey(2),
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
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      userEmail = value;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Please enter valid email address.';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  key: const ValueKey(3),
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
                                  obscureText: true,
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      userPassword = value;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 6 characters long.';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (!isSignUp)
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: const ValueKey(4),
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
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      userEmail = value;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  key: const ValueKey(5),
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
                                  obscureText: true,
                                  onChanged: (value) {
                                    userPassword = value;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      userPassword = value;
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 6 characters long.';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
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
                    child: GestureDetector(
                      onTap: () async {
                        setState(() => isConnecting = true);
                        if (isSignUp) {
                          _checkValidation();
                          try {
                            final newUser =
                              await _authentication.createUserWithEmailAndPassword(
                                email: userEmail,
                                password: userPassword,
                              );
                            
                            await FirebaseFirestore.instance.collection('user')
                              .doc(newUser.user!.uid)
                              .set({
                                'userName': userName,
                                'email': userEmail,
                              });
                            
                            if (newUser.user != null) {
                              setState(() => isConnecting = false);
                            }
                          } on Exception {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please check your e-mail and password'
                                ),
                                backgroundColor: Colors.blue,
                              )
                            );
                            setState(() => isConnecting = false);
                          }
                        } else {
                          _checkValidation();
                          try {
                            final loginUser =
                              await _authentication.signInWithEmailAndPassword(
                                email: userEmail,
                                password: userPassword,
                              );
                            if (loginUser.user != null) {
                              setState(() => isConnecting = false);
                            }
                          } on Exception {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please check your e-mail and password'
                                ),
                                backgroundColor: Colors.blue,
                              )
                            );
                            setState(() => isConnecting = false);
                          }
                        }
                      },
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
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUp ? MediaQuery.of(context).size.height - 128
                  : MediaQuery.of(context).size.height - 168,
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
        ),
      ),
    );
  }
}
