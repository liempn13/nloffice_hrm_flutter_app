import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_button.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_grid_view.dart';

class MenuScreen extends StatelessWidget {
  List<String> labelList = ['Support', 'Attendance', 'Task', 'Notice', ''];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UserInfo(),
              SizedBox(height: 20),
              CustomGridView(
                  dataSet: labelList,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: index.toString(),
                    );
                  })
              // Expanded(
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 16.0,
              //     mainAxisSpacing: 20.0,
              //     children: [
              //       CustomButton(),
              //       MenuButton(icon: Icons.support_agent, label: 'Support'),
              //       MenuButton(icon: Icons.access_time, label: 'Attendance'),
              //       MenuButton(icon: Icons.assignment, label: 'Task'),
              //       MenuButton(icon: Icons.announcement, label: 'Notice'),
              //       MenuButton(
              //           icon: Icons.account_balance_wallet, label: 'Expense'),
              //       MenuButton(icon: Icons.exit_to_app, label: 'Leave'),
              //       MenuButton(icon: Icons.check_circle, label: 'Approval'),
              //       MenuButton(icon: Icons.phone, label: 'Phonebook'),
              //       MenuButton(icon: Icons.map, label: 'Visit'),
              //       MenuButton(icon: Icons.calendar_today, label: 'Appointments'),
              //       MenuButton(icon: Icons.coffee, label: 'Break'),
              //       MenuButton(icon: Icons.bar_chart, label: 'Report'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavController(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.apps_rounded),
          onPressed: () {},
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                // View profile action
              },
              child: Text(
                'VIEW PROFILE',
                style: TextStyle(color: Colors.brown),
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;

  MenuButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundcolor: Colors.brown[50],
      foregroundColor: Colors.brown,
      padding: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () {
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10),
            Text(label),
          ],
        );
      },
    ); //   return ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Colors.brown[50], // màu nền nút
    //       foregroundColor: Colors.brown, //màu item bên trong
    //       padding: EdgeInsets.all(16.0),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8.0),
    //       ),
    //     ),
    //     onPressed: () {},
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Icon(icon, size: 40),
    //         SizedBox(height: 10),
    //         Text(label),
    //       ],
    //     ),
    //   );
  }
}
