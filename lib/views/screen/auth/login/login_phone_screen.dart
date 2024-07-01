import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class LoginPhone extends StatefulWidget {
  final String title;

  LoginPhone({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: phoneController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Enter your phone number",
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
                              height: 10,
                            ),
                            _logInButton(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _logInButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          // Process the phone number
          print('Phone number: ${phoneController.text}');
        } else {
          Navigator.of(context).pushNamed(AppRoutes.homeRoute);
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
          'LogIn',
          style: TextStyle(fontSize: 20, color: Colors.white),
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
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pushNamed(AppRoutes.signupRoute);
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
