import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UserInfo(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 20.0,
                children: [
                  MenuButton(icon: Icons.support_agent, label: 'Support'),
                  MenuButton(icon: Icons.access_time, label: 'Attendance'),
                  MenuButton(icon: Icons.assignment, label: 'Task'),
                  MenuButton(icon: Icons.announcement, label: 'Notice'),
                  MenuButton(
                      icon: Icons.account_balance_wallet, label: 'Expense'),
                  MenuButton(icon: Icons.exit_to_app, label: 'Leave'),
                  MenuButton(icon: Icons.check_circle, label: 'Approval'),
                  MenuButton(icon: Icons.phone, label: 'Phonebook'),
                  MenuButton(icon: Icons.map, label: 'Visit'),
                  MenuButton(icon: Icons.calendar_today, label: 'Appointments'),
                  MenuButton(icon: Icons.coffee, label: 'Break'),
                  MenuButton(icon: Icons.bar_chart, label: 'Report'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {},
            ),
            SizedBox(width: 40), // The dummy child
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.apps_rounded),
        onPressed: () {},
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[50],// màu nền nút
        foregroundColor: Colors.brown,//màu item bên trong
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
