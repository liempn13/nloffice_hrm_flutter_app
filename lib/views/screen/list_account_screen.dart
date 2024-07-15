import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/account/accounts_model.dart';
import 'package:nloffice_hrm/services/account_service.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_list_view.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  // late Future<Accounts> futureAccount;
  @override
  void initState() {
    super.initState();
    // futureAccount = fetchListData();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      showLeadingAction: true,
      title: "Accounts List",
      body: FutureBuilder<List<Accounts>>(
        future: fetchListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // return CustomListView(
            //   dataSet: snapshot.data!,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(snapshot.data![index].username.toString()),
            //       subtitle: Text(snapshot.data![index].password.toString()),
            //     );
            //   },
            // );
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].username.toString()),
                    subtitle: Text(snapshot.data![index].password.toString()),
                  );
                });
          }
        },
      ),
    );
  }
}
