// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

class MonthWeekView extends StatefulWidget {
  const MonthWeekView({super.key});

  @override
  _MonthWeekViewState createState() => _MonthWeekViewState();
}

class _MonthWeekViewState extends State<MonthWeekView> {
  late DateTime _currentDate;
  late DateTime _startOfMonth;
  late DateTime _endOfMonth;
  late DateTime _startOfWeek;
  late DateTime _endOfWeek;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _updateMonthRange(_currentDate);
    _updateWeekRange(_currentDate);
  }

  void _updateMonthRange(DateTime date) {
    _startOfMonth = DateTime(date.year, date.month, 1);
    _endOfMonth = DateTime(date.year, date.month + 1, 0);
  }

  void _updateWeekRange(DateTime date) {
    int dayOfWeek = date.weekday;
    _startOfWeek = date.subtract(Duration(days: dayOfWeek - 1));
    _endOfWeek = date.add(Duration(days: 7 - dayOfWeek));
  }

  void _swipeMonth(bool isNext) {
    setState(() {
      if (isNext) {
        _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
      } else {
        _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
      }
      _updateMonthRange(_currentDate);
      _updateWeekRange(_currentDate);
    });
  }

  void _swipeWeek(bool isNext) {
    setState(() {
      if (isNext) {
        _currentDate = _endOfWeek.add(const Duration(days: 1));
      } else {
        _currentDate = _startOfWeek.subtract(const Duration(days: 1));
      }
      _updateMonthRange(_currentDate);
      _updateWeekRange(_currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Month Week View'),
      ),
      body: Column(
        children: [
          Text('Current Date: $_currentDate'),
          Text('Month Range: $_startOfMonth - $_endOfMonth'),
          Text('Week Range: $_startOfWeek - $_endOfWeek'),
          ElevatedButton(
            onPressed: () => _swipeMonth(false),
            child: const Text('Previous Month'),
          ),
          ElevatedButton(
            onPressed: () => _swipeMonth(true),
            child: const Text('Next Month'),
          ),
          ElevatedButton(
            onPressed: () => _swipeWeek(false),
            child: const Text('Previous Week'),
          ),
          ElevatedButton(
            onPressed: () => _swipeWeek(true),
            child: const Text('Next Week'),
          ),
        ],
      ),
    );
  }
}
