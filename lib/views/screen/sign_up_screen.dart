import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
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
  final _formKey = GlobalKey<FormState>();

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
    return BasePage(
      // showAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
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
                                TextFormField(
                                  controller: nameController,
                                  scrollPadding: EdgeInsets.only(bottom: 150),
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.account_circle_outlined),
                                    labelText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
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
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: phoneController,
                                  scrollPadding: EdgeInsets.only(bottom: 150),
                                  style: TextStyle(fontSize: 18),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    } else if (!RegExp(r'^\d{10}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid phone number';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
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
                                  height: 20,
                                ),
                                TextFormField(
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please re-enter your password';
                                    } else if (value !=
                                        passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: referralController,
                                  scrollPadding: EdgeInsets.only(bottom: 150),
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.switch_account_rounded),
                                    labelText: "Enterprise Code",
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
                      _createAccountButton(),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _alreadyAccount()
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
        if (_formKey.currentState!.validate()) {
          // Process the create account with the form data
          print('Name: ${nameController.text}');
          print('Email: ${emailController.text}');
          print('Phone: ${phoneController.text}');
          print('Password: ${passwordController.text}');
          print('Re-enter Password: ${reEnterPasswordController.text}');
          print('Referral Code: ${referralController.text}');
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
              Colors.blue,
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
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
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
