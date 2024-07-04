import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/diploma/diplomas_model.dart';
import 'package:nloffice_hrm/model/profile/profiles_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/screen/add_diploma_screen.dart';
import 'package:nloffice_hrm/views/screen/edit_diploma_screen.dart';

class InfoDiplomaScreen extends StatefulWidget {
  final Diplomas diploma;
  final Profiles profile;

  InfoDiplomaScreen({
    required this.diploma,
    required this.profile,
  });

  @override
  _InfoDiplomaScreenState createState() => _InfoDiplomaScreenState();
}

class _InfoDiplomaScreenState extends State<InfoDiplomaScreen> {
  List<Diplomas> diplomasList = [];

  @override
  void initState() {
    super.initState();
    diplomasList.add(widget.diploma);
  }

  void addDiploma(Diplomas diploma) {
    setState(() {
      diplomasList.add(diploma);
    });
  }

  void removeDiploma(int index) {
    setState(() {
      diplomasList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bằng cấp đã được xóa thành công'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Hoàn tác',
          onPressed: () {
            // Perform undo action if needed
          },
        ),
      ),
    );
  }

  Future<void> confirmDeleteDialog(int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận xóa'),
          content: Text('Bạn có chắc chắn muốn xóa bằng cấp này?'),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Xóa'),
              onPressed: () {
                removeDiploma(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Thông tin bằng cấp'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/avatar_placeholder.png'), // Add an image asset for placeholder
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        widget.profile.profileName ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.profile.departmentId ?? '',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: diplomasList.length,
                itemBuilder: (context, index) {
                  final diploma = diplomasList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thứ tự bằng cấp: ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InfoTile(
                        icon: Icons.book,
                        label: 'Mã bằng cấp',
                        value: diploma.diplomaId ?? 'Không có',
                      ),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Loại bằng cấp',
                        value: diploma.diplomaName ?? 'Không có',
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
                                  builder: (context) => EditDiplomaScreen(
                                    diploma: diploma,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              confirmDeleteDialog(index);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDiplomaScreen(),
                      ),
                    );
                    if (result != null && result is Diplomas) {
                      addDiploma(result);
                    }
                  },
                ),
              ],
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
            ),
          ),
        ],
      ),
    );
  }
}
