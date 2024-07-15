import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/position/position_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddPositionScreen extends StatefulWidget {
  final Function(Positions) onAdd;

  AddPositionScreen({required this.onAdd});

  @override
  _AddPositionScreenState createState() => _AddPositionScreenState();
}

class _AddPositionScreenState extends State<AddPositionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _positionIdController = TextEditingController();
  final _positionNameController = TextEditingController();
  final _enterpriseIdController = TextEditingController();

  @override
  void dispose() {
    _positionIdController.dispose();
    _positionNameController.dispose();
    _enterpriseIdController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newPosition = Positions(
        positionId: _positionIdController.text,
        positionName: _positionNameController.text,
        enterpriseId: int.tryParse(_enterpriseIdController.text),
      );

      widget.onAdd(newPosition);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thêm chức vụ'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _positionIdController,
                  decoration: InputDecoration(
                    labelText: 'Mã chức vụ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter position ID';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _positionNameController,
                  decoration: InputDecoration(
                    labelText: 'Tên chức vụ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter position name';
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
                    labelText: 'Id Công ty',
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
                child: Text('Thêm chức vụ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
