import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/department/department_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/add_department_screen.dart';
import 'package:nloffice_hrm/views/screen/info_department_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentsScreen extends StatefulWidget {
  @override
  _DepartmentsScreenState createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  List<Departments> departments = [
    Departments(
      departmentID: "1",
      departmentName: "HR",
      enterpriseID: 101,
      departmentStatus: 1,
    ),
    Departments(
      departmentID: "2",
      departmentName: "IT",
      enterpriseID: 102,
      departmentStatus: 1,
    ),
    // Add more departments as needed
  ];

  String _title = 'Danh sách phòng ban';

  @override
  void initState() {
    super.initState();
    _loadTitle();
  }

  Future<void> _loadTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title = prefs.getString('departmentsTitle') ?? 'Danh sách phòng ban';
    });
  }

  Future<void> _saveTitle(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('departmentsTitle', title);
  }

  void _changeTitle() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController =
            TextEditingController(text: _title);
        return AlertDialog(
          title: Text('Đổi tên tiêu đề'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Nhập tên tiêu đề mới'),
          ),
          actions: [
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Lưu'),
              onPressed: () {
                setState(() {
                  _title = titleController.text;
                });
                _saveTitle(titleController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleDelete(Departments department) {
    setState(() {
      departments = departments
          .where((dep) => dep.departmentID != department.departmentID)
          .toList();
    });
  }

  void _handleAdd(Departments newDepartment) {
    setState(() {
      departments.add(newDepartment);
    });
  }

  List<Departments> filteredDepartments = [];
  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDepartments = departments;
      } else {
        filteredDepartments = departments.where((departments) {
          return departments.departmentName!
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
        title: Text(_title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: _changeTitle,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              suggestions: departments
                  .map((departments) => departments.departmentName!)
                  .toList(),
              onTextChanged: _handleSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: departments.length,
              itemBuilder: (context, index) {
                final department = departments[index];
                if (department.departmentStatus == 0)
                  return Container(); // Don't show inactive departments
                return ListTile(
                  title: Text(department.departmentName ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentInfoScreen(
                          department: department,
                          onDelete: () => _handleDelete(department),
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
              builder: (context) => AddDepartmentScreen(onAdd: _handleAdd),
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
