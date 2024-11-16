import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapchat_clone/models/user/user_model.dart';

final userModelProvider = StateProvider((ref) {
  return User(username: '', friendStreak: 0, messages: [], avatar: '');
});
