import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/department/department_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddDepartmentScreen extends StatefulWidget {
  final Function(Departments) onAdd;

  AddDepartmentScreen({required this.onAdd});

  @override
  _AddDepartmentScreenState createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departmentNameController = TextEditingController();
  final _enterpriseIdController = TextEditingController();
  final _departmentIdController = TextEditingController();

  @override
  void dispose() {
    _departmentNameController.dispose();
    _enterpriseIdController.dispose();
    _departmentIdController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newDepartment = Departments(
        departmentID: _departmentIdController.text,
        departmentName: _departmentNameController.text,
        enterpriseID: int.parse(_enterpriseIdController.text),
        departmentStatus: 1,
      );

      widget.onAdd(newDepartment);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Add Department'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _departmentIdController,
                  decoration: InputDecoration(
                    labelText: 'Department ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter department ID';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _departmentNameController,
                  decoration: InputDecoration(
                    labelText: 'Department Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter department name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _enterpriseIdController,
                  decoration: InputDecoration(
                    labelText: 'Enterprise ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter enterprise ID';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Department'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
