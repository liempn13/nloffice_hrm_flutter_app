import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/project/projects_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_card.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_grid_view.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/add_project_screen.dart'; // Đảm bảo import đúng model dự án của bạn

class ProjectsListScreen extends StatefulWidget {
  @override
  _ProjectsListScreenState createState() => _ProjectsListScreenState();
}

class _ProjectsListScreenState extends State<ProjectsListScreen> {
  List<Projects> projects = [
    Projects(projectId: '1', projectName: 'Dự án A', departmentId: 'Phòng A'),
    Projects(projectId: '2', projectName: 'Dự án B', departmentId: 'Phòng B'),
    // Thêm các dự án khác vào đây
  ];

  List<Projects> filteredProjects = [];

  @override
  void initState() {
    super.initState();
    filteredProjects = projects;
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProjects = projects;
      } else {
        filteredProjects = projects.where((project) {
          return project.projectName!
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
        title: Text('Danh sách dự án'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              suggestions:
                  projects.map((project) => project.projectName!).toList(),
              onTextChanged: _handleSearch,
            ),
          ),
          Expanded(
            child: CustomGridView(
              padding: EdgeInsets.all(8.0),
              dataSet: filteredProjects,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return ProjectCard(
                  project: project,
                );
              },
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProjectScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
