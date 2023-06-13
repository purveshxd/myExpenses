// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// String currentUserId = FirebaseAuth.instance.currentUser!.uid;
// CollectionReference<Map<String, dynamic>> userList =
//     FirebaseFirestore.instance.collection('users');

// class FirebaseDatabse {
//   // Stream<DocumentSnapshot<Map<String, dynamic>>> getTransaction() {
//   //   final tList = userList.doc(currentUserId).snapshots().where((event) {
//   //     return event.get('transaction');
//   //   });
//   //   return tList;
//   // }

//   // Future<void> deleteTransaction(int index) async {
//   //   final transactionDataList = userList
//   //       .doc(currentUserId)
//   //       .get()
//   //       .then((value) => value.get('transaction'));
//   //   await userList.doc(currentUserId).update({
//   //     "transaction": [transactionDataList].removeAt(index)
//   //   });
//   // }

//   // Future updateTransaction(tname, tamt, tdate, isExpense) async {
//   //   return await userList.doc(currentUserId).set({
//   //     "transaction": [
//   //       {
//   //         "Tname": tname,
//   //         "Tamt": tamt,
//   //         "Tdate": tdate,
//   //         "isExpense": isExpense,
//   //       },
//   //     ]
//   //   });
//   // }

//   // Future<void> setDefaultTransaction() async {
//   //   return await userList.doc(currentUserId).set({
//   //     "username": FirebaseAuth.instance.currentUser!.displayName.toString(),
//   //     "transaction": [
//   //       {
//   //         "Tname": "Welcome,This is a Expense Manager App",
//   //         "Tamt": 125,
//   //         "Tdate": "Mon, Dec 19",
//   //         "isExpense": true,
//   //       },
//   //       {
//   //         "Tname": "Use the floating action button to add expenses/incomes",
//   //         "Tamt": 254,
//   //         "Tdate": "Mon, Dec 19",
//   //         "isExpense": false,
//   //       },
//   //       {
//   //         "Tname": "Delete these transactions by swiping right on it",
//   //         "Tamt": 100,
//   //         "Tdate": "Mon, Dec 19",
//   //         "isExpense": false,
//   //       },
//   //       {
//   //         "Tname": "Report any bugs by long pressing on the Sign Out button",
//   //         "Tamt": 69,
//   //         "Tdate": "Mon, Dec 19",
//   //         "isExpense": false,
//   //       },
//   //     ]
//   //   });
//   // }
// }
