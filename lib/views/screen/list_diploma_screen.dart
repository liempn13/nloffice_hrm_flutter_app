import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/info_diploma_screen.dart';

class DiplomaListScreen extends StatefulWidget {
  @override
  _DiplomaListScreenState createState() => _DiplomaListScreenState();
}

class _DiplomaListScreenState extends State<DiplomaListScreen> {
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

  final List<Diplomas> diplomas = [
    Diplomas(
      profileId: '1',
      diplomaName: 'Dai hoc',
      diplomaId: 'BSc-001',
    ),
    // Add more diplomas if needed
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
        title: Text('Danh sách bằng cấp'),
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
                final diploma = diplomas.firstWhere(
                  (s) => s.profileId.toString() == profile.profileId,
                  orElse: () => Diplomas(),
                );

                return ListTile(
                  title: Text(profile.profileName ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDiplomaScreen(
                          diploma: diploma,
                          profile: profile,
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
