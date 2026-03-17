class TimeFormat {
  TimeFormat._();

  static String formatTime(final Duration duration) {
    final String hours = duration.inHours
        .remainder(24)
        .toString()
        .padLeft(2, '0');
    final String minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final String seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
}
