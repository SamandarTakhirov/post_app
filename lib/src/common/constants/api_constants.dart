abstract final class ApiConst {
  static const baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "123",
  );

  static const allPostsPath = "/posts";
  static const searchPosts = "/posts/search";
  static const createNewPostPath = "/posts/add";

  static String getPostFromId(int id) => "/posts/$id";

  static String getPostFromUserID(int id) => "/posts/user/$id";

  static String getPostComments(int id) => "/posts/$id/comments";

  static String updatePost(int id) => "/posts/$id";

  static String deletePost(int id) => "/posts/$id";

  static Map<String, String> searchParams(String searchText) => {
        "q": searchText,
      };

  static Map<String, String> paginationParams(int limit, int skip) => {
        "limit": limit.toString(),
        "skip": skip.toString(),
      };
}
