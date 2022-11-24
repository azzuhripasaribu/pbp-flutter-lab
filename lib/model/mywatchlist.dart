import 'dart:convert';

class MyWatchList {
  MyWatchList({
    required this.id,
    required this.watched,
    required this.title,
    required this.rating,
    required this.release_date,
    required this.review,
  });
  
  int id;
  bool watched;
  String title;
  double rating;
  DateTime release_date;
  String review;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    id: json["pk"],
    watched: json["fields"]["watched"],
    title: json["fields"]["title"],
    rating: json["fields"]["rating"],
    release_date: DateTime.parse(json["fields"]["release_date"]),
    review: json["fields"]["review"],
  );

  // Map<String, dynamic> toJson() => {
  //   "watched" : watched,
  //   "title" : title,
  //   "rating": rating,
  //   "release_date" : release_date,
  //   "review" : review,
  // };

}
