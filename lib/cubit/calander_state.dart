
abstract class CalendarState {}

class CalendarInitialState extends CalendarState {}

class CalendarUpdatedState extends CalendarState {
  final DateTime selectedDate;
  final List<Map<String, dynamic>> tasks;

  CalendarUpdatedState({required this.selectedDate, required this.tasks});
}