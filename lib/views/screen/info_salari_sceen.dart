import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/model/salary/salaries_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/edit_salari_screen.dart';

class InfoSalariScreen extends StatelessWidget {
  final Profiles profile;
  final Salaries salary; // Thêm thuộc tính Salaries

  InfoSalariScreen({
    required this.profile,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Profile Salary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/avatar_placeholder.png'), // Add an image asset for placeholder
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        profile.profileName ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        profile.departmentId ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                InfoTile(
                  icon: Icons.monetization_on,
                  label: 'Lương',
                  value: salary.salary?.toString() ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.attach_money,
                  label: 'Phụ cấp',
                  value: salary.allowance?.toString() ?? 'Không có',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Handle the edit action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditSalaryScreen(
                            salary: salary,
                          ),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown),
            SizedBox(width: 16),
            Text('$label: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Expanded(
                child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
