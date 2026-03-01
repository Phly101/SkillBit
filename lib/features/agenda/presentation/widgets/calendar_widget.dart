import 'package:flutter/material.dart';
import 'package:skill_bit/features/agenda/presentation/widgets/arrow_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/theme/app_colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;

  @override
  Widget build(final BuildContext context) {
    return TableCalendar<dynamic>(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        leftChevronIcon: ArrowWidget(arrowIcon: Icons.arrow_back),
        rightChevronIcon: ArrowWidget(arrowIcon: Icons.arrow_forward),
      ),
      daysOfWeekHeight: 20,
      daysOfWeekStyle: const .new(
        weekdayStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        weekendStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      calendarStyle: .new(
        outsideDaysVisible: false,
        defaultTextStyle: const TextStyle(fontWeight: FontWeight.w500),
        weekendTextStyle: const TextStyle(fontWeight: FontWeight.w500),

        selectedDecoration: const BoxDecoration(
          color: AppColors.secondary,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (final DateTime day) => isSameDay(selectedDay, day),
      onDaySelected: onDaySelected,
    );
  }
}
