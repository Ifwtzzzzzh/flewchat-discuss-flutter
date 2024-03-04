import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:discuss_app_v3/configs/api.dart';
import 'package:discuss_app_v3/models/topic.dart';
import 'package:http/http.dart';

class TopicSource {
  static Future<bool> create(
    String title,
    String description,
    String images,
    String base64codes,
    String idUser,
  ) async {
    String url = '${Api.topic}/create.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'title': title,
        'description': description,
        'images': images,
        'base64codes': base64codes,
        'id_user': idUser,
      });
      DMethod.printTitle('Topic Source - Create', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Create', e.toString());
      return false;
    }
  }

  static Future<bool> update(
    String id,
    String title,
    String description,
  ) async {
    String url = '${Api.topic}/update.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'title': title,
        'description': description,
      });
      DMethod.printTitle('Topic Source - Update', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Update', e.toString());
      return false;
    }
  }

  static Future<bool> delete(
    String id,
    String images,
  ) async {
    String url = '${Api.topic}/images.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'images': images,
      });
      DMethod.printTitle('Topic Source - Delete', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Delete', e.toString());
      return false;
    }
  }

  static Future<List<Topic>> readExplore() async {
    String url = '${Api.topic}/read_explorer.php';
    try {
      Response response = await Client().get(Uri.parse(url));
      DMethod.printTitle('Topic Source - Read Explore', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Read Explore', e.toString());
      return [];
    }
  }

  static Future<List<Topic>> readFeed(String idUser) async {
    String url = '${Api.topic}/read_feed.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "id_user": idUser,
      });
      DMethod.printTitle('Topic Source - Read Feed', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Read Feed', e.toString());
      return [];
    }
  }

  static Future<List<Topic>> readWhereIdUser(String idUser) async {
    String url = '${Api.topic}/read_where_id_user.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "id_user": idUser,
      });
      DMethod.printTitle('Topic Source - Read Where ID User', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Read Where ID User', e.toString());
      return [];
    }
  }

  static Future<List<Topic>> search(String query) async {
    String url = '${Api.topic}/search.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "search_query": query,
      });
      DMethod.printTitle('Topic Source - Search', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Topic Source - Search', e.toString());
      return [];
    }
  }
}
