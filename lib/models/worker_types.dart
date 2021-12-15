import 'package:fixatease_worker/assets/worker_icons.dart';
import 'package:flutter/material.dart';

List<AppointmentCatagories> appointmentCatagories = <AppointmentCatagories>[
  AppointmentCatagories("Requests"),
  AppointmentCatagories("Ongoing"),
  AppointmentCatagories("Rejected"),
];

class AppointmentCatagories {
  final String AppointmentTitle;
  AppointmentCatagories(
    this.AppointmentTitle,
  );
}
