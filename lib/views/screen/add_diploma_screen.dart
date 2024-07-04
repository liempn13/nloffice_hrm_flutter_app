import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddDiplomaScreen extends StatefulWidget {
  @override
  _AddDiplomaScreenState createState() => _AddDiplomaScreenState();
}

class _AddDiplomaScreenState extends State<AddDiplomaScreen> {
  final _formKey = GlobalKey<FormState>();
  String? diplomaId;
  String? diplomaName;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thêm bằng cấp'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mã bằng cấp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onSaved: (value) {
                    diplomaId = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mã bằng cấp';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Loại bằng cấp',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onSaved: (value) {
                    diplomaName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập loại bằng cấp';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    Navigator.pop(
                      context,
                      Diplomas(
                        diplomaId: diplomaId,
                        diplomaName: diplomaName,
                      ),
                    );
                  }
                },
                child: Text('Thêm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
