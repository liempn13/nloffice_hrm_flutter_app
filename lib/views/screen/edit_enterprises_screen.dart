import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/enterprise/enterprises_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditEnterpriseScreen extends StatefulWidget {
  final Enterprises enterprise;

  EditEnterpriseScreen({required this.enterprise});

  @override
  _EditEnterpriseScreenState createState() => _EditEnterpriseScreenState();
}

class _EditEnterpriseScreenState extends State<EditEnterpriseScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController assignDateController;

  bool showLoginFields = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.enterprise.name);
    emailController = TextEditingController(text: widget.enterprise.email);
    phoneController = TextEditingController(text: widget.enterprise.phone);
    assignDateController = TextEditingController(
      text: widget.enterprise.assignDate != null
          ? widget.enterprise.assignDate!.toIso8601String().split('T')[0]
          : '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    assignDateController.dispose();
    super.dispose();
  }

  void saveEnterprise() {
    setState(() {
      widget.enterprise.name = nameController.text;
      widget.enterprise.email = emailController.text;
      widget.enterprise.phone = phoneController.text;
      widget.enterprise.assignDate =
          DateTime.tryParse(assignDateController.text);
      // Không cập nhật thông tin đăng nhập ở đây
    });
    Navigator.pop(context, widget.enterprise);
  }

  void toggleLoginFields() {
    setState(() {
      showLoginFields = !showLoginFields;
    });
  }

  void saveLoginInfo() {
    // Handle saving login information here
    // For example, update username and password
    setState(() {
      // Logic to save login info
    });
    toggleLoginFields(); // Hide login fields after saving
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Doanh nghiệp'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveEnterprise,
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return BasePage(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: nameController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Tên',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: emailController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: phoneController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Số điện thoại',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: assignDateController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Assign Date (YYYY-MM-DD)',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
