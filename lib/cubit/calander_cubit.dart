import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitialState()) {
    getTasksForDate(DateTime.now());
  }

  DateTime selectedDate = DateTime.now();

  final Map<String, List<Map<String, dynamic>>> allTasks = {
    '2026-10-11': [
      {
        'title': 'Go to the gym',
        'subtitle': 'Morning workout, 7 AM',
        'priority': 'Medium',
        'color': Colors.orange,
      },
      {
        'title': 'Read a book',
        'subtitle': 'Evening',
        'priority': 'Low',
        'color': Colors.blue,
      },
    ],
  };

  void getTasksForDate(DateTime date) {
    selectedDate = date;
    String dateKey = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    List<Map<String, dynamic>> tasksForDay = allTasks[dateKey] ?? [];
    
    emit(CalendarUpdatedState(selectedDate: selectedDate, tasks: tasksForDay));
  }
}