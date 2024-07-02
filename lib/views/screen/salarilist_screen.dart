import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/model/salary/salaries_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/info_salari_sceen.dart';

class SalaryListScreen extends StatefulWidget {
  @override
  _SalaryListScreenState createState() => _SalaryListScreenState();
}

class _SalaryListScreenState extends State<SalaryListScreen> {
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
    // Add more profiles as needed
  ];
  final List<Salaries> salaries = [
    Salaries(
      salaryId: 1,
      salaryName: 'Base Salary',
      salary: 2.5,
      allowance: 1.2,
      enterpriseId: 63,
      status: 1,
    ),
    // Add more salaries as needed
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
          final salary = salaries.firstWhere(
            (s) => s.salaryId.toString() == profile.salaryId,
            orElse: () => Salaries(),
          );

          return ListTile(
            title: Text(profile.profileName ?? ''),
            subtitle: Text(
                '${profile.departmentId}\nSalary: ${salary.salary ?? 0.0}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoSalariScreen(
                    salary: salary,
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
