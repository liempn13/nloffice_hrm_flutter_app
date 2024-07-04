import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/edit_enterprises_screen.dart';

class InfoEnterpriseScreen extends StatelessWidget {
  final Enterprises enterprise;
  final VoidCallback onDelete;

  InfoEnterpriseScreen({
    required this.enterprise,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thông tin doanh nghiệp'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        enterprise.name ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        enterprise.licenseNum ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                InfoTile(
                  icon: Icons.business,
                  label: 'License Number',
                  value: enterprise.licenseNum ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.email,
                  label: 'E-mail',
                  value: enterprise.email ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.phone,
                  label: 'Phone',
                  value: enterprise.phone ?? 'Không có',
                ),
                InfoTile(
                  icon: Icons.calendar_today,
                  label: 'Assign Date',
                  value: enterprise.assignDate != null
                      ? _formatDate(enterprise.assignDate!)
                      : 'Không có',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Handle the edit action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEnterpriseScreen(
                            enterprise: enterprise,
                          ),
                        ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this enterprise?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                onDelete();
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ],
        );
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown),
            SizedBox(width: 16),
            Text('$label: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Expanded(
                child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
