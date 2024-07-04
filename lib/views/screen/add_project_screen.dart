import 'package:flutter/material.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentIdController = TextEditingController();
  final TextEditingController _enterpriseIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _departmentIdController.dispose();
    _enterpriseIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thêm mới dự án'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Tên dự án',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _departmentIdController,
              decoration: InputDecoration(
                labelText: 'Phòng thực hiện',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _enterpriseIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Mã doanh nghiệp',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add dự án'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
