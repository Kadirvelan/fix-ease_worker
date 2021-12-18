import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixatease_worker/services/database.dart';
import 'package:flutter/material.dart';

class GetAppointmentDetails extends StatefulWidget {
  final String status;

  const GetAppointmentDetails({Key? key, required this.status})
      : super(key: key);

  @override
  _GetAppointmentDetailsState createState() =>
      new _GetAppointmentDetailsState(status);
}

class _GetAppointmentDetailsState extends State<GetAppointmentDetails> {
  String status;
  _GetAppointmentDetailsState(this.status);
  Stream<QuerySnapshot> workerStream = Stream.empty();

  getAppointmentDetails(String status) async {
    workerStream = await DatabaseMethods().getAppointmentDetails(status);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppointmentDetails(status);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String userAddress = "";
    return StreamBuilder<QuerySnapshot>(
        stream: workerStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: (snapshot.data)!.docs.map((document) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.red,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(document['UserMail']),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(DateTime.parse(
                            document['StartTime'].toDate().toString())
                        .toString()),
                    const SizedBox(
                      height: 5.0,
                    ),
                    FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection("users")
                            .doc(document["UserMail"])
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!["Address"]);
                          }
                          return Container();
                        }),
                    buildRowDynamicStatusButtons(document, status),
                  ],
                ),
              ),
            );
          }).toList());
        });
  }

  Row buildRowDynamicStatusButtons(
      QueryDocumentSnapshot<Object?> document, String status) {
    if (status == "Active") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () => {
                    DatabaseMethods()
                        .updateAppointmentStatus(document, "Accepted")
                  },
              child: Text("Accept")),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () => {
                    DatabaseMethods()
                        .updateAppointmentStatus(document, "Rejected")
                  },
              child: Text("Reject")),
        ],
      );
    } else if (status == "Accepted") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () => {
                    DatabaseMethods()
                        .updateAppointmentStatus(document, "Completed")
                  },
              child: Text("Complete")),
          const SizedBox(
            width: 10,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [],
      );
    }
  }

  getData(document) {
    return DatabaseMethods().getData(document).toString();
  }
}
