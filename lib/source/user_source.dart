import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:discuss_app_v3/configs/api.dart';
import 'package:discuss_app_v3/models/user.dart';
import 'package:http/http.dart';

class UserSource {
  static var item;

  // Handles user registration by sending POST request to API and handling response/errors.
  static Future<Map> register(String username, String password) async {
    // Construct the URL for user registration using API endpoint.
    String url = '${Api.user}/register.php';
    try {
      // Sends a POST request to register a user with the provided username and password.
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User Source - Register', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      // Handle errors
      DMethod.printTitle('User Source - Register', e.toString());
      return {'success': false};
    }
  }

  // Handles user login by sending POST request to API and handling response/errors.
  static Future<Map> login(String username, String password) async {
    // Construct the URL for user login using API endpoint.
    String url = '${Api.user}/login.php';
    try {
      // Sends a POST request to register a user with the provided username and password.
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User Source - Login', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      // Handle errors
      DMethod.printTitle('User Source - Login', e.toString());
      return {'success': false};
    }
  }

  // Sends a POST request to update a user's image on the server.
  static Future<bool> updateImage(
    String id,
    String oldImage,
    String newImage,
    String newBase64Code,
  ) async {
    // Construct the URL for update image using API endpoint.
    String url = '${Api.user}/update_image.php';
    try {
      // Send a POST request to update image data, including ID, old and new images, and Base64 code.
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'old_image': oldImage,
        'new_image': newImage,
        'new_base64code': newBase64Code,
      });
      DMethod.printTitle('User Source - Update Image', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('User Source - Update Image', e.toString());
      return false;
    }
  }

  // Handles user stat by sending POST request to API and handling response/errors.
  static Future<Map<String, dynamic>> stat(String idUser) async {
    // Construct the URL for user stat using API endpoint.
    String url = '${Api.user}/stat.php';
    try {
      // Send POST request with user ID to specified URL and await response.
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('User Source - Stat', response.body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      // Handle errors
      DMethod.printTitle('User Source - Stat', e.toString());
      return {
        'topic': 0.0,
        'follower': 0.0,
        'following': 0.0,
      };
    }
  }

  // Handles search user by sending POST request to API and handling response/errors.
  static Future<List<User>> search(String query) async {
    // Construct the URL for user search using API endpoint.
    String url = '${Api.user}/search.php';
    try {
      // Send POST request with search query to specified URL and await response.
      Response response = await Client().post(Uri.parse(url), body: {
        'search_query': query,
      });
      DMethod.printTitle('User Source - Search', response.body);
      Map responseBody = jsonDecode(response.body);
      // Parse successful response data into a list of User objects.
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('User Source - Search', e.toString());
      return [];
    }
  }
}
