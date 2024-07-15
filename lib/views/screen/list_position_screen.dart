import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/position/position_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_seach.dart';
import 'package:nloffice_hrm/views/screen/add_position_screen.dart';

class PositionsListScreen extends StatefulWidget {
  @override
  _PositionsListScreenState createState() => _PositionsListScreenState();
}

class _PositionsListScreenState extends State<PositionsListScreen> {
  List<Positions> positions = [
    Positions(
      positionId: '1',
      positionName: 'Manager',
      enterpriseId: 1,
    ),
    Positions(
      positionId: '2',
      positionName: 'Developer',
      enterpriseId: 1,
    ),
    // Add more positions as needed
  ];

  List<Positions> filteredPositions = [];

  @override
  void initState() {
    super.initState();
    filteredPositions = positions;
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPositions = positions;
      } else {
        filteredPositions = positions.where((position) {
          return position.positionName!
              .toLowerCase()
              .contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _handleAdd(Positions newPosition) {
    setState(() {
      positions.add(newPosition);
      _handleSearch(''); // Reapply search to update filtered positions
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Danh sách chức vụ'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              suggestions:
                  positions.map((position) => position.positionName!).toList(),
              onTextChanged: _handleSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPositions.length,
              itemBuilder: (context, index) {
                final position = filteredPositions[index];

                return ListTile(
                  title: Text(position.positionName ?? ''),
                  subtitle: Text('Enterprise ID: ${position.enterpriseId}'),
                  onTap: () {
                    // Handle tap if necessary, e.g., navigate to a details screen
                  },
                );
              },
            ),
          ),
        ],
      ),
      fab: FloatingActionButton(
        onPressed: () {
          // Implement adding a new position
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPositionScreen(onAdd: _handleAdd),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
