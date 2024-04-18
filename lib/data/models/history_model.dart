class HistoryModel {
  final String time;
  final int movies;

  HistoryModel({
    required this.movies,
    required this.time,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      movies: json["movies"] as int? ?? 0,
      time: json["time"] as String? ?? "",
    );
  }
}
