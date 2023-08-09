class PostModel {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  PostModel({
    this.id,
    this.title,
    this.body,
    this.userId,
    this.tags,
    this.reactions,
  });

  factory PostModel.fromJson(Map<String, Object?> json) => PostModel(
    id: json["id"] as int?,
    body: json["body"] as String?,
    reactions: json["reactions"] as int?,
    tags: List<String>.from((json["tags"] as List?) ?? []),
    title: json["title"] as String?,
    userId: json["userId"] as int?,
  );

  Map<String, Object?> toJson() => {
    "id": id,
    "body": body,
    "reactions": reactions,
    "tags": tags,
    "title": title,
    "userId": userId,
  };
}
