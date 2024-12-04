import 'package:snapchat_clone/models/message/message_model.dart';

class User {
  User({
    required this.username,
    required this.friendStreak,
    required this.messages,
    required this.avatar,
    required this.location,
  });

  final String username;
  final int friendStreak;
  final List<Message> messages;
  final String avatar;
  final Map<String, dynamic> location;

  factory User.fromJson(Map<String, dynamic> json) {
    var messagesFromJson = json['messages'] as List;
    List<Message> messageList =
        messagesFromJson.map((i) => Message.fromJson(i)).toList();

    return User(
        username: json['username'],
        friendStreak: json['friend_streak'],
        messages: messageList,
        avatar: json['avatar'],
        location: json['last_known_location'] ?? {});
  }
}
