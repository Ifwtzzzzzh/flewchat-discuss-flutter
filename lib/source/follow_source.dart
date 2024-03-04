import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:discuss_app_v3/configs/api.dart';
import 'package:discuss_app_v3/models/user.dart';
import 'package:http/http.dart';

class FollowSource {
  // Fetches and returns whether one user is following another via API call.
  static Future<bool> checkIsFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    // Construct the URL for check following using API endpoint.
    String url = '${Api.follow}/check.php';
    try {
      // Send POST request with user IDs to specified URL, awaiting response.
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - Check is Following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Follow Source - Check is Following', e.toString());
      return false;
    }
  }

  // Verifies and reports follow relationship between specified users via JSON response.
  static Future<bool> following(
    String fromIdUser,
    String toIdUser,
  ) async {
    // Construct the URL for following using API endpoint.
    String url = '${Api.follow}/following.php';
    try {
      // Send POST request with user IDs to specified URL, awaiting response.
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - Following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Follow Source - Following', e.toString());
      return false;
    }
  }

  // Unfollows a user (fromIdUser) from another user (toIdUser) using API call.
  static Future<bool> noFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    // Construct the URL for following using API endpoint.
    String url = '${Api.follow}/no_following.php';
    try {
      // Send POST request with user IDs to specified URL, awaiting response.
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Source - No Following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Follow Source - No Following', e.toString());
      return false;
    }
  }

  // Fetches and returns a list of User objects representing the followers of the given user.
  static Future<List<User>> readFollower(String idUser) async {
    // Construct the URL for user search using API endpoint.
    String url = '${Api.follow}/read_follower.php';
    try {
      // Send user ID to server via POST request.
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow Source - Read Follower', response.body);
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
      DMethod.printTitle('Follow Source - Read Follower', e.toString());
      return [];
    }
  }

  // Fetches and returns a list of User objects representing the following of the given user.
  static Future<List<User>> readFollowing(String idUser) async {
    // Construct the URL for user search using API endpoint.
    String url = '${Api.follow}/read_following.php';
    try {
      // Send user ID to server via POST request.
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('Follow Source - Read Following', response.body);
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
      DMethod.printTitle('Follow Source - Read Following', e.toString());
      return [];
    }
  }
}
