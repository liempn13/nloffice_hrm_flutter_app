import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/relatives/relatives_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditRelativeScreen extends StatefulWidget {
  final Relatives relative;

  EditRelativeScreen({required this.relative});

  @override
  _EditRelativeScreenState createState() => _EditRelativeScreenState();
}

class _EditRelativeScreenState extends State<EditRelativeScreen> {
  late TextEditingController profileIdController;
  late TextEditingController relativesNameController;
  late TextEditingController relativesPhoneController;
  late TextEditingController relativesBirthdayController;

  @override
  void initState() {
    super.initState();
    profileIdController =
        TextEditingController(text: widget.relative.profileId);
    relativesNameController =
        TextEditingController(text: widget.relative.relativesName);
    relativesPhoneController =
        TextEditingController(text: widget.relative.relativesPhone);
    relativesBirthdayController =
        TextEditingController(text: widget.relative.relativesBirthday);
  }

  @override
  void dispose() {
    profileIdController.dispose();
    relativesNameController.dispose();
    relativesPhoneController.dispose();
    relativesBirthdayController.dispose();
    super.dispose();
  }

  void saveRelative() {
    setState(() {
      widget.relative.profileId = profileIdController.text;
      widget.relative.relativesName = relativesNameController.text;
      widget.relative.relativesPhone = relativesPhoneController.text;
      widget.relative.relativesBirthday = relativesBirthdayController.text;
    });
    Navigator.pop(context, widget.relative);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Edit Relative'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveRelative,
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
                              controller: profileIdController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Profile ID',
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
                              controller: relativesNameController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Relative Name',
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
                              controller: relativesPhoneController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Relative Phone',
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
                              controller: relativesBirthdayController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Relative Birthday',
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
