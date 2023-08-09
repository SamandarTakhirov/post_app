abstract final class ApiConst {
  static const _baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "...",
  );

  static const apiKey = String.fromEnvironment(
    "api_key",
    defaultValue:  "..."
  );



  static const allPostsPath = "$_baseUrl/posts";
  static const searchPosts = "$_baseUrl/posts/search";
  static const createNewPostPath = "$_baseUrl/posts/add";

  static String getPostFromId(int id) => "$_baseUrl/posts/$id";

  static String getUserPosts(int id) => "$_baseUrl/posts/user/$id";

  static String getPostComments(int id) => "$_baseUrl/posts/$id/comments";

  static String updatePost(int id) => "$_baseUrl/posts/$id";

  static String deletePost(int id) => "$_baseUrl/posts/$id";

  static Map<String, List<String>> searchParams(String searchText) => {
        "q": [searchText],
      };

  static Map<String, List<String>> paginationParams(int limit, int skip) => {
        "limit": [limit.toString()],
        "skip": [skip.toString()],
      };
}
