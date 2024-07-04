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
        title: const Text('Thông tin'),
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
                              controller: nameController,
                              scrollPadding: const EdgeInsets.only(bottom: 150),
                              style: const TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                labelText: 'Tên',
                                border: const OutlineInputBorder(
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
                              scrollPadding: const EdgeInsets.only(bottom: 150),
                              style: const TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                labelText: 'ID doanh nghiệp',
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
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: const Size(
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
