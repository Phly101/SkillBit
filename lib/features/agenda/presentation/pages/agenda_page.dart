import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/agenda/presentation/widgets/agenda_header.dart';
import 'package:skill_bit/features/agenda/presentation/widgets/calendar_widget.dart';
import 'package:skill_bit/features/agenda/presentation/widgets/notification_card.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  TextEditingController subjectController = .new();
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    subjectController.dispose();
    super.dispose();
  }

  void _showAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (final BuildContext context) {
        return StatefulBuilder(
          builder: (final BuildContext context, final Function setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Add Task for ${_selectedDay.day}/${_selectedDay.month}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: subjectController,
                    maxLines: 1,
                    maxLength: 30,
                    decoration: const InputDecoration(
                      labelText: 'Subject (ex: Study OOP)',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.access_time),
                    title: Text(
                      _selectedTime == null
                          ? 'Select Time'
                          : 'Time: ${_selectedTime!.format(context)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        setState(() => _selectedTime = picked);
                        setSheetState(() {});
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Save Task',
                      style: context.textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AgendaHeader(),
              80.heightBox,
              CalendarWidget(
                selectedDay: _selectedDay,
                focusedDay: _focusedDay,
                onDaySelected:
                    (final DateTime selected, final DateTime focused) {
                      setState(() {
                        _selectedDay = selected;
                        _focusedDay = focused;
                      });
                    },
              ).pH(10),
              NotificationCard(
                title: subjectController.text,
                date: '${_selectedDay.year}',
                time: '${_selectedTime?.format(context)}',
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: _showAddTaskSheet,
              child: const Icon(Icons.add, size: 25),
            ),
          ),
        ),
      ],
    );
  }
}
