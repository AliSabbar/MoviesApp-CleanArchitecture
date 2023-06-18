class AppConstance {
  static String timeConvert(minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return "$hours\H $remainingMinutes\M";
  }
}
