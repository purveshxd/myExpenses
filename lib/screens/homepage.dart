import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/Hivedatabase/hive_database.dart';
import 'package:myexpenses/components/app_bar.dart';
import 'package:myexpenses/widgets/in_out_expense.dart';
import 'package:myexpenses/widgets/input_text_field.dart';

import '../components/app_body.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //

  final _mybox = Hive.box('taskBox');
  @override
  void initState() {
    if (_mybox.get('EXP') == null) {
      database.initialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  //
  var database = HiveDatebase();
  DateTime expenseDate = DateTime.now();
  TextEditingController expenseTitle = TextEditingController();
  TextEditingController expenseAmt = TextEditingController();
  ValueNotifier<bool> isExpense = ValueNotifier(false);

  void showAddTransactionBox() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            insetPadding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0, top: 5),
                      child: Text(
                        "Add Transaction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // TextField to exter expense title
                    InputTextField(
                        hintText: "Enter Title",
                        textController: expenseTitle,
                        textInputType: TextInputType.text),
                    const SizedBox(height: 15),
                    // TextField to enter expense amount
                    InputTextField(
                        hintText: "Enter Amount",
                        textController: expenseAmt,
                        textInputType: TextInputType.number),
                    const SizedBox(height: 15),
                    // Switch button for expense or income selection
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const InOutExpenceWidget(isExpense: false),
                          const Text("Income"),
//
                          ValueListenableBuilder(
                            valueListenable: isExpense,
                            builder: (context, currState, child) {
                              return Switch(
                                value: currState,
                                onChanged: (val) {
                                  isExpense.value = val;
                                },
                              );
                            },
                          ),
                          //

                          const Text("Expense"),
                          const InOutExpenceWidget(isExpense: true)
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Button to show date picker
                    MaterialButton(
                      height: 55,
                      onPressed: showTransactionDatePicker,
                      color: Colors.grey.shade100,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Enter Date",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            color: Colors.white,
                            width: 2,
                            height: 55,
                          ),
                          const Spacer(),
                          Text(
                            DateFormat.MMMEd().format(
                              DateTime.now(),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Button to add the transaction to the list in home page
                    MaterialButton(
                      height: 50,
                      elevation: 0,
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: addTransaction,
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
    debugPrint(_mybox.values.toString());
  }

  String totalExpenses() {
    var totalExp = 0;
    for (var element in database.expensesList) {
      if (element[3] == true) {
        totalExp = element[2] + totalExp;
        // debugPrint(element[2].toString());
      } else {}
    }
    return totalExp.toString();
  }

  String totalIncome() {
    var totalExp = 0;
    for (var element in database.expensesList) {
      if (element[3] == false) {
        totalExp = element[2] + totalExp;
        // debugPrint(element[2].toString());
      } else {}
    }
    return totalExp.toString();
  }

  void showTransactionDatePicker() {
    //
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.parse("2010-02-27"),
      lastDate: DateTime.parse("2030-02-27"),
    ).then((value) {
      setState(() {
        expenseDate = value!;
      });
    });
  }

// add transaction to the list
  void addTransaction() {
    if (expenseAmt.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const Dialog(
              child: Text("Expense can't be empty"),
            );
          });
    } else {
      setState(() {
        database.expensesList = [
          [
            expenseTitle.text,
            DateFormat.MMMEd().format(expenseDate),
            int.parse(
              expenseAmt.text,
            ),
            isExpense.value
          ],
          ...database.expensesList
        ];
      });
    }
    Navigator.of(context).pop();
    database.updateDate();
    expenseTitle.clear();
    expenseAmt.clear();
    debugPrint(database.expensesList.toString());
  }

  void deleteTransaction(index) {
    setState(() {
      database.expensesList.removeAt(index);
    });
    database.updateDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade300,
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: BodyWidget(
          onSlide: (p0) => deleteTransaction(p0),
          expensesList: database.expensesList,
          totalExpense: totalExpenses(),
          totalIncome: totalIncome(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: showAddTransactionBox,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
