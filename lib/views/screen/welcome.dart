import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Section
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                // Logo and text
                Text(
                  'NLOffice HRM\nPowered by NLOffice.vn'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none, // Ensure no underline
                  ),
                ),
                SizedBox(height: 10),
                // Language icon
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ],
            ),
          ),
          // Center Section
          Column(
            children: [
              Text(
                'Chào mừng bạn đến với\n NLOffice HRM dành cho\n doanh nghiệp',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black // Ensure no underline
                    ),
              ),
              SizedBox(height: 350),
              Text(
                'Công ty / thương hiệu của bạn\n đã sử dụng NLOffice HRM chưa?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Colors.black // Ensure no underline
                    ),
              ),
            ],
          ),
          // Bottom Section
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200, // Set the width to be the same for both buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getColor),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 16),
                      ),
                    ),
                    child: Text(
                      'Doanh nghiệp',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                ),
                SizedBox(
                  width: 200, // Set the width to be the same for both buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getColor),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 16),
                      ),
                    ),
                    child: Text(
                      'Nhân viên',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.blue;
    }
    return Colors.white;
  }
}
