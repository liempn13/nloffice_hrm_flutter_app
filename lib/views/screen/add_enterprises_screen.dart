import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';

class AddEnterpriseScreen extends StatefulWidget {
  final void Function(Enterprises) onAdd;

  AddEnterpriseScreen({required this.onAdd});

  @override
  _AddEnterpriseScreenState createState() => _AddEnterpriseScreenState();
}

class _AddEnterpriseScreenState extends State<AddEnterpriseScreen> {
  late TextEditingController enterprisesNameController;
  late TextEditingController enterprisesLicenseNumberController;
  late TextEditingController enterprisesEmailController;
  late TextEditingController enterprisesPhoneController;
  late TextEditingController enterprisesAssignDateController;
  final _formKey = GlobalKey<FormState>();
  final _enterprise = Enterprises();

  @override
  void initState() {
    super.initState();
    enterprisesNameController = TextEditingController();
    enterprisesLicenseNumberController = TextEditingController();
    enterprisesEmailController = TextEditingController();
    enterprisesPhoneController = TextEditingController();
    enterprisesAssignDateController = TextEditingController();
  }

  @override
  void dispose() {
    enterprisesNameController.dispose();
    enterprisesLicenseNumberController.dispose();
    enterprisesEmailController.dispose();
    enterprisesPhoneController.dispose();
    enterprisesAssignDateController.dispose();
    super.dispose();
  }

  void addEnterprise() {
    final newEnterprise = Enterprises(
      name: enterprisesNameController.text,
      licenseNum: enterprisesLicenseNumberController.text,
      email: enterprisesEmailController.text,
      phone: enterprisesPhoneController.text,
      assignDate: DateTime.parse(enterprisesAssignDateController.text),
    );
    widget.onAdd(newEnterprise);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Enterprise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: enterprisesNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: enterprisesLicenseNumberController,
                  decoration: const InputDecoration(
                    labelText: 'License Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: enterprisesEmailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: enterprisesPhoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: enterprisesAssignDateController,
                  decoration: const InputDecoration(
                    labelText: 'Assign Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addEnterprise();
                  }
                },
                child: const Text('Add Enterprise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
