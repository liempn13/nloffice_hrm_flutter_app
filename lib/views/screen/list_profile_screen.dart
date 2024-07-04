import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/add_profile_screen.dart';
import 'package:nloffice_hrm/views/screen/info_profile_screen.dart';

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
      enterpriseId: 63,
      salaryId: '1',
    ),
    Profiles(
      profileName: 'Tô Châu Nhựt Lâm',
      profileStatus: 1,
      phone: '0979889678',
      email: 'khanhduong.le@vtcmobile.vn',
      departmentId: 'HR',
      birthday: DateTime.parse('2000-01-01'),
      enterpriseId: 63,
      salaryId: '1',
    ),
    Profiles(
      profileName: 'Tô Châu Bảo Linh',
      profileStatus: 1,
      phone: '0979889678',
      email: 'khanhduong.le@vtcmobile.vn',
      departmentId: 'HR',
      birthday: DateTime.parse('2000-01-01'),
      enterpriseId: 63,
      salaryId: '1',
    ),
    // Add more profiles as needed
  ];

  List<Profiles> filteredProfiles = [];

  @override
  void initState() {
    super.initState();
    filteredProfiles = profiles;
  }

  void _handleDelete() {
    setState(() {
      profiles =
          profiles.where((profile) => profile.profileStatus != 0).toList();
      filteredProfiles = profiles;
    });
  }

  void _handleAdd(Profiles newProfile) {
    setState(() {
      profiles.add(newProfile);
      filteredProfiles = profiles;
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProfiles = profiles;
      } else {
        filteredProfiles = profiles.where((profile) {
          return profile.profileName!
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Danh sách nhân viên'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              suggestions:
                  profiles.map((profile) => profile.profileName!).toList(),
              onTextChanged: _handleSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProfiles.length,
              itemBuilder: (context, index) {
                final profile = filteredProfiles[index];

                return ListTile(
                  title: Text(profile.profileName ?? ''),
                  subtitle: Text('${profile.departmentId}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoProfileScreen(
                          profile: profile,
                          onDelete: _handleDelete,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
        backgroundColor: Colors.blue,
      ),
    );
  }
}
