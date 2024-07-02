import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';

class AddEnterpriseScreen extends StatefulWidget {
  final void Function(Enterprises) onAdd;

  AddEnterpriseScreen({required this.onAdd});

  @override
  _AddEnterpriseScreenState createState() => _AddEnterpriseScreenState();
}

class _AddEnterpriseScreenState extends State<AddEnterpriseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _enterprise = Enterprises();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Enterprise'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _enterprise.name = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'License Number'),
                onSaved: (value) => _enterprise.licenseNum = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _enterprise.email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _enterprise.phone = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Assign Date'),
                onSaved: (value) =>
                    _enterprise.assignDate = DateTime.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                onSaved: (value) =>
                    _enterprise.enterpriseStatus = int.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  widget.onAdd(_enterprise);
                  Navigator.pop(context);
                },
                child: Text('Add Enterprise'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
