class GamePlatform {
  final String id;
  final String title;
  final String logo;

  GamePlatform({required this.id, required this.title, required this.logo});

  Map<String, dynamic> toJson() {
    return {'title': title, 'logo': logo};
  }
}
