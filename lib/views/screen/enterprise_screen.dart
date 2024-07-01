import 'package:flutter/material.dart';

class CompanyInfoPage extends StatelessWidget {
  final companyInfo;

  CompanyInfoPage({required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyInfo.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              companyInfo.address,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Text(companyInfo.phone),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text(companyInfo.email),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.web),
                SizedBox(width: 8),
                Text(companyInfo.website),
              ],
            ),
            SizedBox(height: 16),
            Text(
              companyInfo.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
