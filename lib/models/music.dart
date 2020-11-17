class Music{
  String name;

  Music({this.name});

  factory Music.fromMap(Map<String, dynamic> parsedJson) {
    return Music(
      name: parsedJson["name"],
    );
  }
}

