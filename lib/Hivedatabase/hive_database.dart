import 'package:hive_flutter/hive_flutter.dart';

class HiveDatebase {
  var mybox = Hive.box('taskBox');

  List expensesList = [
    // Data format
    // ["title","date",amount,isExpense]
  ];

  void initialData() {
    expensesList = [
      ["Welcome,This is a Expense Manager App", "Mon, Dec 19", 125, true],
      [
        "Use the floating action button to add expenses/incomes",
        "Mon, Dec 19",
        125,
        true
      ],
      [
        "Delete these transactions by swiping right on it",
        "Mon, Dec 19",
        125,
        false
      ],
      [
        "Report any bugs by long pressing on the Sign Out button",
        "Mon, Dec 19",
        125,
        false
      ],
    ];
  }

  void loadData() {
    expensesList = mybox.get('EXP');
  }

  void updateDate() {
    mybox.put('EXP', expensesList);
  }
}
