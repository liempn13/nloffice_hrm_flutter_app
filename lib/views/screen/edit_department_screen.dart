import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/department/department_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditDepartmentScreen extends StatefulWidget {
  final Departments department;

  EditDepartmentScreen({required this.department});

  @override
  _EditDepartmentScreenState createState() => _EditDepartmentScreenState();
}

class _EditDepartmentScreenState extends State<EditDepartmentScreen> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController enterpriseIdController;
  bool status = false;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController(text: widget.department.departmentID);
    nameController =
        TextEditingController(text: widget.department.departmentName);
    enterpriseIdController =
        TextEditingController(text: widget.department.enterpriseID?.toString());
    status = widget.department.departmentStatus == 1;
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    enterpriseIdController.dispose();
    super.dispose();
  }

  void saveDepartment() {
    setState(() {
      widget.department.departmentID = idController.text;
      widget.department.departmentName = nameController.text;
      widget.department.enterpriseID =
          int.tryParse(enterpriseIdController.text);
      widget.department.departmentStatus = status ? 1 : 0;
    });
    Navigator.pop(context, widget.department);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Edit Department'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              controller: idController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Department ID',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: nameController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Department Name',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: enterpriseIdController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Enterprise ID',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: saveDepartment,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(
                        double.infinity, 50), // Make the button span full width
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
