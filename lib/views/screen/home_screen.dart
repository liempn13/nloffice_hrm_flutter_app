import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B258A),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Switch(
              value: light,
              activeColor: Colors.yellow,
              inactiveThumbColor: Colors.black,
              thumbIcon: WidgetStatePropertyAll<Icon>(Icon(light
                  ? Icons.light_mode_rounded
                  : Icons.nightlight_outlined)),
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              }),
        ], // Drawer icon color
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, right: 25, left: 20),
            decoration: BoxDecoration(
              color: Color(0xFF0B258A),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hi, Username",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/image/male_avatar.png"))),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Flash(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: ListView(),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Column(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
