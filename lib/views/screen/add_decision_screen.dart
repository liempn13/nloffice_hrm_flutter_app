import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/decision/decisions_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddDecisionScreen extends StatefulWidget {
  @override
  _AddDecisionScreenState createState() => _AddDecisionScreenState();
}

class _AddDecisionScreenState extends State<AddDecisionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _decisionNameController = TextEditingController();
  final _salaryIdController = TextEditingController();
  final _enterpriseIdController = TextEditingController();

  @override
  void dispose() {
    _decisionNameController.dispose();
    _salaryIdController.dispose();
    _enterpriseIdController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newDecision = Decisions(
        decisionName: _decisionNameController.text,
        salaryId: _salaryIdController.text,
        enterpriseId: int.parse(_enterpriseIdController.text),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thêm quyết định'),
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
                  controller: _decisionNameController,
                  decoration: InputDecoration(
                    labelText: 'Tên quyết định',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên quyết định';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _salaryIdController,
                  decoration: InputDecoration(
                    labelText: 'Mã lương',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã lương';
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
                    labelText: 'Mã công ty',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã công ty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Thêm quyết định'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
