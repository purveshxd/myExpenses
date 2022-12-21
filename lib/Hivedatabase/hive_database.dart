
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatebase {
  List expensesList = [
    // Data format
    // ["title","date",amount,isExpense]
  ];

  var mybox = Hive.box('taskBox');

  void initialData() {
    expensesList = [
      // Data format
      // ["title","date",amount,isExpense]
      ["Chocolates", "Mon, Dec 19", 125, true],
      ["Petrol", "Mon, Dec 19", 200, false],
    ];
  }

  void loadData() {
    expensesList = mybox.get('EXP');
  }

  void updateDate() {
    mybox.put('EXP', expensesList);
  }
}
