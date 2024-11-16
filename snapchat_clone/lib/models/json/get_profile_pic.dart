import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:snapchat_clone/models/images/profile_picture.dart';

class GetProfilePic {
  final _filepath = 'assets/json/profile_picture.json';

  Future<List<ProfilePicture>> loadProfilePicture() async {
    final String response = await rootBundle.loadString(_filepath);
    final data = json.decode(response);
    var fromJson = data['picture'] as List;
    print(fromJson);
    return fromJson
        .map((userJson) => ProfilePicture.fromJson(userJson))
        .toList();
  }
}
