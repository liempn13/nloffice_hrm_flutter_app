import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditProfileScreen extends StatefulWidget {
  final Profiles profile;

  EditProfileScreen({required this.profile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController departmentController;
  TextEditingController? loginUsernameController;
  TextEditingController? loginPasswordController;

  bool showLoginFields = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile.profileName);
    emailController = TextEditingController(text: widget.profile.email);
    phoneController = TextEditingController(text: widget.profile.phone);
    departmentController =
        TextEditingController(text: widget.profile.departmentId);
    loginUsernameController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    departmentController.dispose();
    loginUsernameController?.dispose();
    loginPasswordController?.dispose();
    super.dispose();
  }

  void saveProfile() {
    setState(() {
      widget.profile.profileName = nameController.text;
      widget.profile.email = emailController.text;
      widget.profile.phone = phoneController.text;
      widget.profile.departmentId = departmentController.text;
      // Không cập nhật thông tin đăng nhập ở đây
    });
    Navigator.pop(context, widget.profile);
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
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveProfile,
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return IntrinsicHeight(
          child: Padding(
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
                                labelText: 'Name',
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
                                labelText: 'Phone',
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
                              controller: departmentController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Department',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          // Add more TextFields as needed
                          if (showLoginFields) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                controller: loginUsernameController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                controller: loginPasswordController,
                                scrollPadding: EdgeInsets.only(bottom: 150),
                                style: TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: saveLoginInfo,
                              child: Text('Save',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blue, // Background color
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: toggleLoginFields,
                  child: Text(
                    showLoginFields ? 'Cancel' : 'Change Login Info',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(
                        double.infinity, 50), // Make the button span full width
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
