class Album {
  final List<dynamic> audiourls;

  const Album({
    required this.audiourls,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(audiourls: json['data']['ayahs']);
  }
}
