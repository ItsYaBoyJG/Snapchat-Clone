import 'package:flutter/material.dart';
import 'package:snapchat_clone/models/widgets/discover/for_you_tile.dart';
import 'package:snapchat_clone/models/widgets/discover/story_tile.dart';
import 'package:snapchat_clone/models/widgets/discover/sub_tile.dart';
import 'package:snapchat_clone/view/profile/avatar/avatar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera),
          ),
          actions: const [ProfileAvatar()],
        ),
        body: Stack(
          children: [
            ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: const [
                SubTile(),
                Divider(
                  color: Colors.black,
                ),
                ForYouTile(),
                Divider(
                  color: Colors.black,
                ),
                StoryTile(),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ],
        ));
  }
}
