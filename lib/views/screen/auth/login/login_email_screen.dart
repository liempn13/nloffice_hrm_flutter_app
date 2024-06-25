import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/screen/sign_up_screen.dart';

class LoginEmail extends StatefulWidget {
  final String title;

  LoginEmail({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      //_title(),
                      //Text('Login to continue'),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: usernameController,
                                  scrollPadding: EdgeInsets.only(bottom: 150),
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  scrollPadding: EdgeInsets.only(bottom: 150),
                                  style: TextStyle(fontSize: 18),
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _forgetPassword(),
                                SizedBox(
                                  height: 10,
                                ),
                                _logInButton(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      'OR',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                _createAccount(),
                                SizedBox(
                                  height: 20,
                                ),
                                _loginGoogle()
                              ],
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // _forgetPassword(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     _logInButton()
                      //   ],

                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       child: Text(
                      //         'OR',
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // _createAccount(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [_loginGoogle()],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logInButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          // Process the login with email and password
          print('Email: ${usernameController.text}');
          print('Password: ${passwordController.text}');
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade100,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromARGB(255, 250, 3, 3),
              Color.fromARGB(255, 255, 12, 4),
            ],
          ),
        ),
        child: Text(
          'LogIn',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _forgetPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 0),
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => {},
        child: Text(
          'Forget password?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _createAccount() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'New user? ',
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: 'Create An Account',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAcount(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginGoogle() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Googlelogo.png",
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}