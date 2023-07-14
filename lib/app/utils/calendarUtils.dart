class CalendarUtil{

  static int endDateOfMonth(DateTime date) {
    DateTime dateTime = DateTime.utc(date.year, date.month + 1);
    dateTime = dateTime.subtract(const Duration(days: 1));

    return dateTime.day;
  }
}