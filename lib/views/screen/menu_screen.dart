import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_route.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/bottom_nav_controller.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_grid_view.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String _departmentTitle = 'Phòng ban';

  @override
  void initState() {
    super.initState();
    _loadDepartmentTitle();
  }

  Future<void> _loadDepartmentTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _departmentTitle = prefs.getString('departmentsTitle') ?? 'Phòng ban';
    });
  }

  void _onRefresh() {
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    _refreshController.loadComplete();
  }

  List<Map<String, dynamic>> _getData() {
    return [
      {
        'icon': Icons.supervisor_account,
        'text': 'Nhân viên',
        'route': AppRoutes.profileListRoute
      },
      {
        'icon': Icons.groups_rounded,
        'text': _departmentTitle,
        'route': AppRoutes.departmentListRoute
      },
      {
        'icon': Icons.assignment, 'text': 'Task',
        // 'route': AppRoutes.taskRoute
      },
      {
        'icon': Icons.announcement,
        'text': 'Notice',
        // 'route': AppRoutes.noticeRoute
      },
      {
        'icon': Icons.account_balance_wallet,
        'text': 'Expense',
        // 'route': AppRoutes.expenseRoute
      },
      {
        'icon': Icons.approval,
        'text': 'Approval',
        // 'route': AppRoutes.approvalRoute
      },
      {
        'icon': Icons.phone,
        'text': 'Phonebook',
        // 'route': AppRoutes.phonebookRoute
      },
      {
        'icon': Icons.event,
        'text': 'Appointments',
        // 'route': AppRoutes.appointmentsRoute
      },
      {
        'icon': Icons.map, 'text': 'Visit',
        //  'route': AppRoutes.visitRoute
      },
      {
        'icon': Icons.coffee, 'text': 'Break',
        //  'route': AppRoutes.breakRoute
      },
      {
        'icon': Icons.report, 'text': 'Report',
        // 'route': AppRoutes.reportRoute
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = _getData();
    return BasePage(
      showAppBar: true,
      showLeadingAction: false,
      appBar: AppBar(
        title: UserInfo(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle),
        )
      ],
      body: CustomGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: EdgeInsets.all(8.0),
        dataSet: data,
        itemBuilder: (context, index) {
          final item = data[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(item['route']);
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 40),
                  SizedBox(height: 8),
                  Text(item['text'], style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      fabl: FloatingActionButtonLocation.centerDocked,
      fab: FloatingActionButton(
        child: Icon(Icons.apps_rounded),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.menuRoute);
        },
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // View profile action
                },
                child: Text(
                  'VIEW PROFILE',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
