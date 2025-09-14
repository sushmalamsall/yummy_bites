import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yummy_bites/theme/app_colors.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime pickedDate) onDatePicked;
  final DateTime? firstDay;
  final DateTime? lastDay;

  const CustomDatePicker({
    super.key,
    required this.onDatePicked,
    this.firstDay,
    this.lastDay,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final DateTime firstDay = widget.firstDay ?? DateTime(2000);
    final DateTime lastDay = widget.lastDay ?? DateTime.now();

    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
        widget.onDatePicked(selectedDay);
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.5,
            color: AppColors.of(context).primaryYellow,
          ),
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}
