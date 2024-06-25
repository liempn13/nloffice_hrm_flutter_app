import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_button.dart';
import 'package:nloffice_hrm/views/screen/auth/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Top Section
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topRight,
                child: CustomButton(
                  padding: EdgeInsets.only(left: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                  ),
                )),
            // Language icon
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //   ),
            // ),
            // Center Section
            Text(
              'Chào mừng bạn đến với\n NLOffice HRM dành cho\n doanh nghiệp'
                  .tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                // color: Colors.black // Ensure no underline
              ),
            ),
            SizedBox(height: 350),
            // Text(
            //   'Công ty / thương hiệu của bạn\n đã sử dụng NLOffice HRM chưa?',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 16,
            //     decoration: TextDecoration.none,
            //     // color: Colors.black // Ensure no underline
            //   ),
            // ),
            Text(
              'NLOffice HRM\nPowered by NLOffice.vn'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.black54 // Ensure no underline
                  ),
            ),
            // Bottom Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                backgroundcolor: Colors.blue[400],
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Tiếp tục đăng nhập',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // style: ButtonStyle(
            //   backgroundColor: WidgetStateProperty.resolveWith(getColor),
            //   padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            //     EdgeInsets.symmetric(vertical: 26, horizontal: 24),
            //   ),
            //   textStyle: WidgetStateProperty.all<TextStyle>(
            //     TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Color getColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return Colors.blue;
    }
    return Colors.white;
  }
}
