import 'post_model.dart';

class BaseModel {
  List<PostModel> posts;
  int? total;
  int? limit;
  int? skip;

  BaseModel({
    required this.posts,
    this.limit,
    this.skip,
    this.total,
  });

  factory BaseModel.fromJson(Map<String, Object?> json) =>
      BaseModel(posts: json["posts"] != null
          ? List<Map<String, Object?>>.from(json["posts"] as List)
          .map(PostModel.fromJson)
          .toList()
          : [],
        total:  json["total"] as int?,
        limit:  json["limit"] as int?,
        skip:  json["skip"] as int?,
      );

  Map<String, Object?> toJson() => {
    "posts": posts.map((e) => e.toJson()).toList(),
    "total": total,
    "limit": limit,
    "skip": skip,
  };
}