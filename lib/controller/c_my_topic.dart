import 'package:discuss_app_v3/models/topic.dart';
import 'package:discuss_app_v3/source/topic_source.dart';
import 'package:flutter/foundation.dart';

class CMyTopic extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopics(String idUser) async {
    _topics = await TopicSource.readWhereIdUser(idUser);
    notifyListeners();
  }
}
