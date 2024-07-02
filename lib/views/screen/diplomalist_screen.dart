import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
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
    // Thêm nhiều profile khác nếu cần
  ];

  final List<Diplomas> diplomas = [
    Diplomas(
      profileId: '1',
      diplomaName: 'Dai hoc',
      diplomaId: 'BSc-001',
    ),
    // Thêm nhiều diploma khác nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
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
    );
  }
}
