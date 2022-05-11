class AyatAudio {
  final String audioUrl;

  const AyatAudio({
    required this.audioUrl,
  });

  factory AyatAudio.fromJson(Map<String, dynamic> json) {
    return AyatAudio(audioUrl: json['data']['audio']);
  }
}
