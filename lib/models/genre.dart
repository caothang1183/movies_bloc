class Genre {
  final int id;
  final String name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(Map<String, dynamic> json)
      : id = json["id"].toInt(),
        name = json["name"];
}
