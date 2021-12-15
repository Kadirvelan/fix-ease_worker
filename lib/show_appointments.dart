import 'package:flutter/material.dart';
import 'package:fixatease_worker/assets/worker_icons.dart';
import 'get_appointment_details.dart';
import 'models/worker_types.dart';

class ShowAppointments extends StatefulWidget {
  const ShowAppointments({Key? key}) : super(key: key);

  @override
  _ShowAppointmentsState createState() => _ShowAppointmentsState();
}

class _ShowAppointmentsState extends State<ShowAppointments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          bottom: TabBar(
              tabs: appointmentCatagories
                  .map((e) => Tab(text: e.AppointmentTitle))
                  .toList()),
          title: Text('Pick a Service'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            GetAppointmentDetails(
              status: 'Active',
            ),
            GetAppointmentDetails(
              status: 'Accepted',
            ),
            GetAppointmentDetails(
              status: 'Rejected',
            ),
          ],
        ),
      ),
    );
  }
}
