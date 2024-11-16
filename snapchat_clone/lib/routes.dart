import 'package:go_router/go_router.dart';
import 'package:snapchat_clone/view/camera/camera.dart';
import 'package:snapchat_clone/view/chats/chat_page.dart';
import 'package:snapchat_clone/view/discover/discover.dart';
import 'package:snapchat_clone/view/home/home_page.dart';
import 'package:snapchat_clone/view/messages/messages_view.dart';
import 'package:snapchat_clone/view/profile/friends_list/friend_list.dart';
import 'package:snapchat_clone/view/profile/friends_list/selected.dart';
import 'package:snapchat_clone/view/profile/profile_page.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
    path: '/discover',
    builder: (context, state) {
      return const DiscoverPage();
    },
  ),
  GoRoute(
    path: '/camera',
    builder: (context, state) {
      return const CameraDisplay();
    },
  ),
  GoRoute(
    path: '/chat',
    builder: (context, state) {
      return const ChatPage();
    },
  ),
  GoRoute(
    path: '/messages',
    builder: (context, state) {
      return const MessagesView();
    },
  ),
  GoRoute(
    path: '/profile',
    builder: (context, state) {
      return const ProfilePage();
    },
  ),
  GoRoute(
    path: '/friends',
    builder: (context, state) {
      return const FriendList();
    },
  ),
  GoRoute(
    path: '/selected/:name/:snaps/:following/:image',
    name: 'selected',
    builder: (context, state) {
      return SelectedProfile(
        name: state.pathParameters['name']!,
        snaps: state.pathParameters['snaps']!,
        following: state.pathParameters['following']!,
        image: state.pathParameters['image']!,
      );
    },
  )
]);
