import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_phone.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_email.dart';

class login_Screen extends StatefulWidget {
  const login_Screen({Key? key}) : super(key: key);

  @override
  State<login_Screen> createState() => _TapBarState();
}

class _TapBarState extends State<login_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              padding: const EdgeInsets.only(left: 20, top: 20),
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
                  border: Border.all(color: Colors.red),
                ),
                child: TabBar(
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red,
                            blurRadius: 5.0,
                            spreadRadius: 1.5,
                            offset: Offset(0.0, 2.0))
                      ]),
                  indicatorSize: TabBarIndicatorSize.tab,
                  //labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabs: const [
                    Tab(
                      text: 'Phone Number',
                    ),
                    Tab(
                      text: 'Email Address',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: login_Email(title: 'Login')),
                  Center(child: login_Phone(title: 'Login')),
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
