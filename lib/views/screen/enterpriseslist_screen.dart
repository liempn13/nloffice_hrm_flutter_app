import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';
import 'package:nloffice_hrm/views/screen/add_enterprises_screen.dart';
import 'package:nloffice_hrm/views/screen/info_enterprises_screen.dart';

class EnterpriseListScreen extends StatefulWidget {
  @override
  _EnterpriseListScreenState createState() => _EnterpriseListScreenState();
}

class _EnterpriseListScreenState extends State<EnterpriseListScreen> {
  List<Enterprises> enterprises = [
    Enterprises(
      enterpriseId: '1',
      name: 'Enterprise One',
      licenseNum: '12345',
      email: 'enterprise1@example.com',
      phone: '123456789',
      assignDate: DateTime.parse('2022-01-01'),
      enterpriseStatus: 1,
    ),
    // Add more enterprises as needed
  ];

  void _handleDelete(Enterprises enterprise) {
    setState(() {
      enterprises = enterprises
          .where((e) => e.enterpriseId != enterprise.enterpriseId)
          .toList();
    });
  }

  void _handleAdd(Enterprises newEnterprise) {
    setState(() {
      enterprises.add(newEnterprise);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enterprise List'),
      ),
      body: ListView.builder(
        itemCount: enterprises.length,
        itemBuilder: (context, index) {
          final enterprise = enterprises[index];

          return ListTile(
            title: Text(enterprise.name ?? ''),
            subtitle: Text('${enterprise.licenseNum}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoEnterpriseScreen(
                    enterprise: enterprise,
                    onDelete: () => _handleDelete(enterprise),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEnterpriseScreen(onAdd: _handleAdd),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
