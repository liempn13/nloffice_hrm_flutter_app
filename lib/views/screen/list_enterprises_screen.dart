import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/add_enterprises_screen.dart';

class EnterprisesListScreen extends StatefulWidget {
  @override
  _EnterprisesListScreenState createState() => _EnterprisesListScreenState();
}

class _EnterprisesListScreenState extends State<EnterprisesListScreen> {
  List<Enterprises> enterprisesList = [];
  List<Enterprises> filteredEnterprisesList = [];

  @override
  void initState() {
    super.initState();
    filteredEnterprisesList = enterprisesList;
  }

  void _addEnterprise(Enterprises newEnterprise) {
    setState(() {
      enterprisesList.add(newEnterprise);
      _handleSearch(''); // Reapply search to update filtered enterprises list
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredEnterprisesList = enterprisesList;
      } else {
        filteredEnterprisesList = enterprisesList.where((enterprise) {
          return enterprise.name!.toLowerCase().contains(query.toLowerCase()) ||
              enterprise.licenseNum!
                  .toLowerCase()
                  .contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: const Text('Danh sách doanh nghiệp'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              suggestions: enterprisesList
                  .map((enterprise) => enterprise.name!)
                  .toList(),
              onTextChanged: _handleSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEnterprisesList.length,
              itemBuilder: (context, index) {
                final enterprise = filteredEnterprisesList[index];
                return ListTile(
                  title: Text(enterprise.name ?? ''),
                  subtitle: Text(enterprise.licenseNum ?? ''),
                );
              },
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEnterpriseScreen(onAdd: _addEnterprise),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
