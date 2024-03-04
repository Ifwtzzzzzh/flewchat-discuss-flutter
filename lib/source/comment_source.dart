import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:discuss_app_v3/configs/api.dart';
import 'package:discuss_app_v3/models/comment.dart';
import 'package:http/http.dart';

class CommentSource {
  static Future<bool> create(
    String idTopic,
    String fromIdUser,
    String toIdUser,
    String description,
    String image,
    String base64code,
  ) async {
    String url = '${Api.comment}/create.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_topic': idTopic,
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
        'description': description,
        'image': image,
        'base64codes': base64code,
      });
      DMethod.printTitle('Comment Source - Create', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Comment Source - Create', e.toString());
      return false;
    }
  }

  static Future<bool> delete(String id, String image) async {
    String url = '${Api.comment}/delete.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'image': image,
      });
      DMethod.printTitle('Comment Source - Delete', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Comment Source - Delete', e.toString());
      return false;
    }
  }

  static Future<List<Comment>> read(String idTopic) async {
    String url = '${Api.comment}/read.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "id_topic": idTopic,
      });
      DMethod.printTitle('Comment Source - Read', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Comment.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      // Handle errors
      DMethod.printTitle('Comment Source - Read', e.toString());
      return [];
    }
  }
}
