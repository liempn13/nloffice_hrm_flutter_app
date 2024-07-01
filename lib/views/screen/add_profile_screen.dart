import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddProfilePage extends StatefulWidget {
  final Function(Profiles) onAdd;

  AddProfilePage({required this.onAdd});

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _profileNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _departmentController = TextEditingController();
  DateTime _birthday = DateTime.now();

  @override
  void dispose() {
    _profileNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newProfile = Profiles(
        profileName: _profileNameController.text,
        profileStatus: 1,
        phone: _phoneController.text,
        email: _emailController.text,
        departmentId: _departmentController.text,
        birthday: _birthday,
      );

      widget.onAdd(newProfile);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Add Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _profileNameController,
                decoration: InputDecoration(labelText: 'Profile Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter profile name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _departmentController,
                decoration: InputDecoration(labelText: 'Department'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter department';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
