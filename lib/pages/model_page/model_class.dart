class ModelDataPosts {
  int userId;
  int id;
  String title;
  String body;

  ModelDataPosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ModelDataPosts.fromJson(Map<String, dynamic> json) => ModelDataPosts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
