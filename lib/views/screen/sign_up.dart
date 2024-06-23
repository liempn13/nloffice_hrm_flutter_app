import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_screen.dart';

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnterPasswordController = TextEditingController();
  final referralController = TextEditingController();
  bool ckrememberLogin = false;
  bool _passwordVisible = false;
  bool _reEnterPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _reEnterPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    _title(),
                    Text('Create an account now'),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: nameController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.account_circle_outlined),
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: emailController,
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
                                  filled: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: phoneController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: "Phone",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
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
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: reEnterPasswordController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: !_reEnterPasswordVisible,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_open_rounded),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _reEnterPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _reEnterPasswordVisible =
                                            !_reEnterPasswordVisible;
                                      });
                                    },
                                  ),
                                  labelText: "Re-enter the password",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: referralController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.switch_account_rounded),
                                  labelText: "Referral Code (optional)",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _ckremember(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [_createAccountButton()],
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
                      height: 20,
                    ),
                    _alreadyAccount()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Join Us",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 30, color: Colors.black),
      ),
    );
  }

  Widget _createAccountButton() {
    return InkWell(
      onTap: () {
        // Process the create account with the form data
        print('Name: ${nameController.text}');
        print('Email: ${emailController.text}');
        print('Phone: ${phoneController.text}');
        print('Password: ${passwordController.text}');
        print('Re-enter Password: ${reEnterPasswordController.text}');
        print('Referral Code: ${referralController.text}');
      },
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
          'Create Account',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _alreadyAccount() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_Screen(),
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

  Widget _ckremember() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
            value: ckrememberLogin,
            onChanged: (bool? newValue) {
              setState(() {
                ckrememberLogin = newValue ?? false;
              });
            },
          ),
          Container(
            child: Text(
              "I agree to the terms and conditions",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
