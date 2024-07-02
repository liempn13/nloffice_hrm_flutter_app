import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';

class InfoEnterpriseScreen extends StatelessWidget {
  final Enterprises enterprise;
  final VoidCallback onDelete;

  InfoEnterpriseScreen({
    required this.enterprise,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(enterprise.name ?? ''),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('License Number: ${enterprise.licenseNum}'),
            Text('Email: ${enterprise.email}'),
            Text('Phone: ${enterprise.phone}'),
            Text('Assign Date: ${enterprise.assignDate}'),
            Text('Status: ${enterprise.enterpriseStatus}'),
          ],
        ),
      ),
    );
  }
}
