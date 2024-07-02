import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditDiplomaScreen extends StatefulWidget {
  final Diplomas diploma;

  EditDiplomaScreen({required this.diploma});

  @override
  _EditDiplomaScreenState createState() => _EditDiplomaScreenState();
}

class _EditDiplomaScreenState extends State<EditDiplomaScreen> {
  late TextEditingController profileIdController;
  late TextEditingController diplomaNameController;
  late TextEditingController diplomaIdController;

  @override
  void initState() {
    super.initState();
    profileIdController = TextEditingController(text: widget.diploma.profileId);
    diplomaNameController =
        TextEditingController(text: widget.diploma.diplomaName);
    diplomaIdController = TextEditingController(text: widget.diploma.diplomaId);
  }

  @override
  void dispose() {
    profileIdController.dispose();
    diplomaNameController.dispose();
    diplomaIdController.dispose();
    super.dispose();
  }

  void saveDiploma() {
    setState(() {
      widget.diploma.profileId = profileIdController.text;
      widget.diploma.diplomaName = diplomaNameController.text;
      widget.diploma.diplomaId = diplomaIdController.text;
    });
    Navigator.pop(context, widget.diploma);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Edit Diploma'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveDiploma,
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
                              controller: diplomaNameController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Diploma Name',
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
                              controller: diplomaIdController,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Diploma ID',
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
