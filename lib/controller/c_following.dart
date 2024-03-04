import 'package:discuss_app_v3/models/user.dart';
import 'package:discuss_app_v3/source/follow_source.dart';
import 'package:flutter/foundation.dart';

class CFollowing extends ChangeNotifier {
  List<User> _list = [];
  List<User> get list => _list;
  setList(String idUser) async {
    _list = await FollowSource.readFollowing(idUser);
    notifyListeners();
  }
}