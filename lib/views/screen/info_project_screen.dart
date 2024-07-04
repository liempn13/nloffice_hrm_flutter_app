import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/project/projects_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class InfoProjectScreen extends StatelessWidget {
  final Projects project;
  final VoidCallback onDelete;

  InfoProjectScreen({required this.project, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thông tin dự án'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.projectName ?? 'Tên dự án không có',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Mã dự án: ${project.projectId ?? 'Không có'}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Mã doanh nghiệp: ${project.enterpriseId ?? 'Không có'}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phòng thực hiện: ${project.departmentId ?? 'Không có'}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Handle the edit action
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EditProjectScreen(
                    //       project: project,
                    //     ),
                    //   ),
                    // ).then((_) {
                    //   // Update UI when returning from EditProjectScreen
                    //   Navigator.pop(context); // Return to previous screen
                    // });
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

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc chắn muốn xóa dự án này không?'),
          actions: [
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Xóa'),
              onPressed: () {
                onDelete(); // Trigger onDelete callback
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pop(context); // Return to previous screen
              },
            ),
          ],
        );
      },
    );
  }
}
