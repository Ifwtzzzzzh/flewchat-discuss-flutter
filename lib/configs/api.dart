class Api {
  // Defines base URL for API endpoints
  static const _baseUrl = "http://192.168.137.1/discuss_app_api";
  static const comment = "$_baseUrl/comment";
  static const follow = "$_baseUrl/follow";
  static const topic = "$_baseUrl/topic";
  static const user = "$_baseUrl/user";

  // Constants for image URLs, constructed using a base URL and specific paths for comments, topics, and users.
  static const imageComment = "$_baseUrl/image/comment";
  static const imageTopic = "$_baseUrl/image/topic";
  static const imageUser = "$_baseUrl/image/user";
}
