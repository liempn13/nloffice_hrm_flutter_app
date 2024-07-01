import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/add_profile_screen.dart';
import 'package:nloffice_hrm/views/screen/info_profile_screen.dart'; // Update the import path accordingly

class ProfileListScreen extends StatefulWidget {
  @override
  _ProfileListScreenState createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  List<Profiles> profiles = [
    Profiles(
      profileName: 'Lê Khánh Dương',
      profileStatus: 1,
      phone: '0979889678',
      email: 'khanhduong.le@vtcmobile.vn',
      departmentId: 'HR',
      birthday: DateTime.parse('2000-01-01'),
      enterpriseId: 063,
    ),

    // Add more profiles as needed
  ];

  void _handleDelete() {
    setState(() {
      profiles =
          profiles.where((profile) => profile.profileStatus != 0).toList();
    });
  }

  void _handleAdd(Profiles newProfile) {
    setState(() {
      profiles.add(newProfile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Profiles List'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ListTile(
            title: Text(profile.profileName ?? ''),
            subtitle: Text(profile.departmentId ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoProfilePage(
                    profile: profile,
                    onDelete: _handleDelete,
                  ),
                ),
              );
            },
          );
        },
      ),
      fab: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProfilePage(onAdd: _handleAdd),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor:
            Colors.blue, // Change the color to your preferred color
      ),
    );
  }
}
