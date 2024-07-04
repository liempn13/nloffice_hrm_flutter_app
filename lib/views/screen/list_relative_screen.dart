import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/model/relatives/relatives_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/info_relative_screen.dart';

class RelativeListScreen extends StatefulWidget {
  @override
  _RelativeListScreenState createState() => _RelativeListScreenState();
}

class _RelativeListScreenState extends State<RelativeListScreen> {
  List<Profiles> profiles = [
    Profiles(
      profileId: '1',
      profileName: 'Lê Khánh Dương',
      profileStatus: 1,
      phone: '0979889678',
      email: 'khanhduong.le@vtcmobile.vn',
      departmentId: 'HR',
      birthday: DateTime.parse('2000-01-01'),
      enterpriseId: 63,
    ),
    // Add more profiles if needed
  ];
  List<Relatives> relatives = [
    Relatives(
      profileId: '1',
      relativesName: 'Nguyen Van A',
      relativesPhone: '0987654321',
      relativesBirthday: '1980-01-01',
    ),
    // Add more relatives if needed
  ];

  List<Profiles> filteredProfiles = [];

  @override
  void initState() {
    super.initState();
    filteredProfiles = profiles;
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
        title: Text('Danh sách thân nhân'),
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
                final relative = relatives.firstWhere(
                  (s) => s.profileId.toString() == profile.profileId,
                  orElse: () => Relatives(),
                );
                return ListTile(
                  title: Text(profile.profileName ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoRelativeScreen(
                          profile: profile,
                          relatives: relatives,
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
    );
  }
}
