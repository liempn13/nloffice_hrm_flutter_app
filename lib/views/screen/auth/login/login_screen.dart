import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_email_screen.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_phone_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _TapBarState();
}

class _TapBarState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BasePage(
        showAppBar: true,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: _title(),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                //padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                ),
                child: TabBar(
                  labelColor: Colors.blue[800],
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.blue[400],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 1.3,
                            spreadRadius: 1.5,
                            offset: Offset(0.0, 2.0))
                      ]),
                  indicatorSize: TabBarIndicatorSize.tab,
                  //labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabs: const [
                    Tab(
                      text: 'Email Address',
                    ),
                    Tab(
                      text: 'Phone Number',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: LoginEmail(title: 'Login')),
                  Center(child: LoginPhone(title: 'Login')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        Text(
          'Login to continue',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
