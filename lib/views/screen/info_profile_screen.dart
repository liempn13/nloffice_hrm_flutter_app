import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/edit_profile_screen.dart';

class InfoProfilePage extends StatelessWidget {
  final Profiles profile;
  final VoidCallback onDelete;

  InfoProfilePage({required this.profile, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Profile Information'),
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
                  icon: Icons.phone,
                  label: 'Điện thoại',
                  value: profile.phone ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.email,
                  label: 'E-mail',
                  value: profile.email ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.business,
                  label: 'Phòng',
                  value: profile.departmentId ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.cake,
                  label: 'Ngày sinh',
                  value: profile.birthday?.toIso8601String() ?? 'Không có',
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
                          builder: (context) =>
                              EditProfileScreen(profile: profile),
                        ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this profile?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                profile.deactivate();
                onDelete();
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ],
        );
      },
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
            // SizedBox(width: 16),
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
