import 'package:flutter/material.dart';
import 'package:nloffice_hrm/model/salary/salaries_model.dart';
import 'package:nloffice_hrm/views/custom_widgets/base_page.dart';

class EditSalaryScreen extends StatefulWidget {
  final Salaries salary;

  EditSalaryScreen({required this.salary});

  @override
  _EditSalaryScreenState createState() => _EditSalaryScreenState();
}

class _EditSalaryScreenState extends State<EditSalaryScreen> {
  late TextEditingController salaryAmountController;
  late TextEditingController allowanceController;

  @override
  void initState() {
    super.initState();
    salaryAmountController =
        TextEditingController(text: widget.salary.salary.toString());
    allowanceController =
        TextEditingController(text: widget.salary.allowance.toString());
  }

  @override
  void dispose() {
    salaryAmountController.dispose();
    allowanceController.dispose();
    super.dispose();
  }

  void saveSalary() {
    setState(() {
      widget.salary.salary =
          double.tryParse(salaryAmountController.text) ?? 0.0;
      widget.salary.allowance =
          double.tryParse(allowanceController.text) ?? 0.0;
    });
    Navigator.pop(context, widget.salary);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        title: Text('Edit Salary'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveSalary,
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
                              controller: salaryAmountController,
                              keyboardType: TextInputType.number,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Lương',
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
                              controller: allowanceController,
                              keyboardType: TextInputType.number,
                              scrollPadding: EdgeInsets.only(bottom: 150),
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                labelText: 'Phụ cấp',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          // Add more TextFields as needed
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
