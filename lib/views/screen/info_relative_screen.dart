import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/model/relatives/relatives_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/add_relative_screen.dart';
import 'package:nloffice_hrm/views/screen/edit_relative_screen.dart';

class InfoRelativeScreen extends StatefulWidget {
  final Profiles profile;
  final List<Relatives> relatives;

  InfoRelativeScreen({
    required this.profile,
    required this.relatives,
  });

  @override
  _InfoRelativeScreenState createState() => _InfoRelativeScreenState();
}

class _InfoRelativeScreenState extends State<InfoRelativeScreen> {
  List<Relatives> relatives = [];

  @override
  void initState() {
    super.initState();
    relatives = widget.relatives;
  }

  void addRelative(Relatives relative) {
    setState(() {
      relatives.add(relative);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thông tin thân nhân'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: relatives.length,
                itemBuilder: (context, index) {
                  final relative = relatives[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thân nhân ${index + 1}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      InfoTile(
                        icon: Icons.person,
                        label: 'Tên',
                        value: relative.relativesName ?? 'Unknown',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Số điện thoại',
                        value: relative.relativesPhone ?? 'Unknown',
                      ),
                      InfoTile(
                        icon: Icons.cake,
                        label: 'Ngày sinh',
                        value: relative.relativesBirthday ?? 'Unknown',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditRelativeScreen(
                                      relative: relative,
                                    ),
                                  ));
                            },
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddRelativeScreen(
                      onAddRelative: addRelative,
                    ),
                  ),
                );
              },
              child: Text('Add Relative'),
            ),
          ],
        ),
      ),
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
    );
  }
}
