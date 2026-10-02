import 'package:flutter/material.dart';

class DatePickerHelper {
  static Future<DateTime?> selectDate(
    BuildContext context, {
    DateTime? initialDate,
  }) async {
    DateTime now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    return pickedDate;
  }

  static Future<TimeOfDay?> selectTime(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) async {
    TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? now,
    );

    return pickedTime;
  }

  String formatTime(TimeOfDay time, BuildContext context) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return TimeOfDay.fromDateTime(dt).format(context);
  }
}
