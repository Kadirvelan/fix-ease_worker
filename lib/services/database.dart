import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixatease_worker/services/auth_helper.dart';
import 'package:flutter/cupertino.dart';

final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

class DatabaseMethods {
  User? user = auth.currentUser;
  Future adduserInfoToDB(Map<String, dynamic> userInfoMap) async {
    return firestoreInstance
        .collection("workers")
        .doc(user?.email)
        .set(userInfoMap);
  }

  Future updateAppointmentStatus(document, String Status) async {
    return FirebaseFirestore.instance
        .collection('Appointments')
        .doc(document.id)
        .update({'Status': Status});
  }
  //
  // confirmDetails(BuildContext context,Map<String,dynamic> userInfoMap) async {
  //   adduserInfoToDB(userInfoMap);
  // }

  Future<Stream<QuerySnapshot>> getAppointmentDetails(String Status) async {
    return firestoreInstance
        .collection("Appointments")
        .where("WorkerMail", isEqualTo: user?.email)
        .where("Status", isEqualTo: Status)
        .orderBy("StartTime", descending: false)
        .snapshots();
  }

  String UserAddress = "HI";
  Future<void> getUserDetails(document) async {
    print(document['UserMail']);
    await firestoreInstance
        .collection("users")
        .doc(document['UserMail'])
        .get()
        .then((value) {
      UserAddress = value.get('Address');
    });
  }

  String getData(document) {
    getUserDetails(document);
    return UserAddress;
  }
}
