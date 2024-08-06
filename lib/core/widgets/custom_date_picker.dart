import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDatePickerTimeline extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final ValueChanged<DateTime>? onDateSelected;

  const CustomDatePickerTimeline({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onDateSelected,
  });

  @override
  CustomDatePickerTimelineState createState() =>
      CustomDatePickerTimelineState();
}

class CustomDatePickerTimelineState extends State<CustomDatePickerTimeline> {
  DateTime _selectedDate = DateTime.now();
  late List<DateTime> _dates;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _dates = _generateDateRange(widget.startDate, widget.endDate);
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<DateTime> _generateDateRange(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    DateTime currentDate = start;
    while (currentDate.isBefore(end) || currentDate.isAtSameMomentAs(end)) {
      dates.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return dates;
  }

  void _scrollToToday() {
    DateTime today = DateTime.now();
    int index = _dates.indexWhere((date) => _isSameDay(date, today));
    if (index != -1) {
      double itemWidth = 68.0;
      double viewportWidth = MediaQuery.of(context).size.width;
      double padding = 10;

      double offset = (index * (itemWidth + 16)) -
          (viewportWidth / 2) +
          (itemWidth / 2) +
          padding;
      _scrollController.jumpTo(offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    final theme = Theme.of(context);
    return SizedBox(
      height: 120,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          DateTime date = _dates[index];
          bool isSelected = _selectedDate.isAtSameMomentAs(date);
          bool isToday = _isSameDay(date, today);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
                if (widget.onDateSelected != null) {
                  widget.onDateSelected!(date);
                }
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 72,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : (isToday
                              ? theme.colorScheme.primary.withOpacity(0.1)
                              : theme.colorScheme.surface),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d').format(date),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onBackground,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          DateFormat('MMM').format(date),
                          style: GoogleFonts.inter(
                            color: isSelected
                                ? theme.colorScheme.background.withOpacity(0.5)
                                : theme.colorScheme.onSecondary,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isToday)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 56,
                      height: 6,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
