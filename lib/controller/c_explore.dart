import 'package:discuss_app_v3/models/topic.dart';
import 'package:discuss_app_v3/source/topic_source.dart';
import 'package:flutter/foundation.dart';

class CExplore extends ChangeNotifier {
  List<Topic> _topics = [];
  List<Topic> get topics => _topics;
  setTopics() async {
    _topics = await TopicSource.readExplore();
    notifyListeners();
  }
}
