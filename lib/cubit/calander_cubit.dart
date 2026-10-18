import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/database/task_database.dart';
import 'calander_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitialState()) {
    getTasksForDate(DateTime.now());
  }

  DateTime selectedDate = DateTime.now();
  final DatabaseHelper dbHelper = DatabaseHelper();

  void getTasksForDate(DateTime date) async {
    selectedDate = date;
    
    final allTasksList = await dbHelper.createDatabase().then((db) => db.query('tasks'));
    
    String formattedDate = 
    "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    List<Map<String, dynamic>> tasksForDay = [];

    for (var item in allTasksList) {
      if (item['date'] == formattedDate) {
        tasksForDay.add({
          'title': item['title'] ?? '',
          'subtitle': item['notes'] ?? '',
          'priority': item['priority'] ?? 'Low',
          'color': item['priority'] == 'High' 
              ? Colors.red 
              : item['priority'] == 'Medium' 
                  ? Colors.orange 
                  : Colors.blue,
        });
      }
    }

    emit(CalendarUpdatedState(selectedDate: selectedDate, tasks: tasksForDay));
  }
}