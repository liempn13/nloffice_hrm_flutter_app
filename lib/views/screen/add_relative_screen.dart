import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/relatives/relatives_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class AddRelativeScreen extends StatefulWidget {
  final Function(Relatives) onAddRelative;

  AddRelativeScreen({required this.onAddRelative});

  @override
  _AddRelativeScreenState createState() => _AddRelativeScreenState();
}

class _AddRelativeScreenState extends State<AddRelativeScreen> {
  late TextEditingController profileIdController;
  late TextEditingController relativesNameController;
  late TextEditingController relativesPhoneController;
  late TextEditingController relativesBirthdayController;

  @override
  void initState() {
    super.initState();
    profileIdController = TextEditingController();
    relativesNameController = TextEditingController();
    relativesPhoneController = TextEditingController();
    relativesBirthdayController = TextEditingController();
  }

  @override
  void dispose() {
    profileIdController.dispose();
    relativesNameController.dispose();
    relativesPhoneController.dispose();
    relativesBirthdayController.dispose();
    super.dispose();
  }

  void addRelative() {
    final newRelative = Relatives(
      profileId: profileIdController.text,
      relativesName: relativesNameController.text,
      relativesPhone: relativesPhoneController.text,
      relativesBirthday: relativesBirthdayController.text,
    );
    widget.onAddRelative(newRelative);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Add Relative'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: addRelative,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: profileIdController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Profile ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: relativesNameController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Relative Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: relativesPhoneController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Relative Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: relativesBirthdayController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Relative Birthday',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
