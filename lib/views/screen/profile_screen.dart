// import 'package:authentic_cars/model/feature_model.dart';
import 'package:flutter/material.dart';

// import '../utils/gradient_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // storing index for managing colors
  int selectedIndex = 0;
  Image avatar = Image.asset('assets/images/male_avatar.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // App Bar
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(Icons.edit_outlined),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: avatar.image,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    ),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30))),
                alignment: Alignment.center,
                child: Text(
                  "",
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 110,
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff1c1c1c), Color(0xff222222)])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          size: 35,
                          color: Colors.red,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
          // PageView to display avatar on top of everything using stack
          PageView(
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  width: 250,
                  child: avatar,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
