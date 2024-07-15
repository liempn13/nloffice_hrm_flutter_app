import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/services/diploma_service.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/info_diploma_screen.dart';

class DiplomaListScreen extends StatefulWidget {
  @override
  _DiplomaListScreenState createState() => _DiplomaListScreenState();
}

class _DiplomaListScreenState extends State<DiplomaListScreen> {
  final List<Diplomas> diplomas = [
    Diplomas(
      profileId: '1',
      diplomaName: 'Dai hoc',
      diplomaId: 'BSc-001',
    ),
    // Add more diplomas if needed
  ];

  @override
  void initState() {
    super.initState();
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
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: CustomSearchBar(
          //     suggestions:
          //         profiles.map((profile) => profile.profileName!).toList(),
          //     onTextChanged: _handleSearch,
          //   ),
          // ),
          Expanded(
              child: FutureBuilder<List<Diplomas>>(
            future: fetchListData(),
            builder: (context, snapshot) {
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  
                );
              });
            },
          )),
        ],
      ),
    );
  }
}
