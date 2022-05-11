class SurahAudio {
  final List<dynamic> audiourls;

  const SurahAudio({
    required this.audiourls,
  });

  factory SurahAudio.fromJson(Map<String, dynamic> json) {
    return SurahAudio(audiourls: json['data']['ayahs']);
  }
}
