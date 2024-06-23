import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nloffice_hrm/views/screen/sign_up.dart';

class login_Email extends StatefulWidget {
  String title;

  login_Email({Key? key, required this.title}) : super(key: key);
  @override
  State<login_Email> createState() => _login_screenState();
}

class _login_screenState extends State<login_Email> {
  final usernameController = TextEditingController();
  final PasswordController = TextEditingController();
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
                              TextField(
                                controller: usernameController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: false,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                controller: PasswordController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outline),
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _forgetPas(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [_LogInButon()],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _createAcout(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [_loginGoogle()],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () => {Navigator.pop(context)},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ),
            ),
            Text(
              "Back",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _LogInButon() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width / 1.09,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 250, 3, 3),
                  Color.fromARGB(255, 255, 12, 4)
                ]),
          ),
          child: Text(
            'LogIn',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _forgetPas() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () => {},
          child: Text(
            'Forget password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ));
  }

  Widget _createAcout() {
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
                                builder: (context) => CreateAcount()));
                      })
              ]))
        ],
      ),
    );
  }

  Widget _loginGoogle() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width / 1.09,
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
                width: 40,
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
