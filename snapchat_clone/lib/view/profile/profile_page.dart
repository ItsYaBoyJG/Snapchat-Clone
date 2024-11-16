import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapchat_clone/models/enums/data_type.dart';
import 'package:snapchat_clone/view/profile/images/memories_list.dart';
import 'package:snapchat_clone/view/profile/images/snap_list.dart';
import 'package:snapchat_clone/view/profile/images/stories_list.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final DataType _dataType = DataType.snaps;

  int snapTotals = 20;
  int friends = 50;
  int following = 200;
  @override
  Widget build(BuildContext context) {
    final selected = useState(_dataType);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width - 2,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.amber,
                    ),
                    Text('User Name '),
                    Text('user ID '),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width - 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Snap Totals',
                          style: TextStyle(color: Colors.black)),
                      Text('$snapTotals',
                          style: const TextStyle(color: Colors.black))
                    ],
                  ),
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Friends',
                            style: TextStyle(color: Colors.black)),
                        Text('$friends',
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                    onTap: () {
                      context.push('/friends');
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Following',
                          style: TextStyle(color: Colors.black)),
                      Text('$following',
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width - 5,
            child: Column(
              children: [
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          selected.value = DataType.snaps;
                        },
                        child: const Text(
                          'Snaps',
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          selected.value = DataType.stories;
                        },
                        child: const Text('Stories',
                            style: TextStyle(color: Colors.black))),
                    TextButton(
                        onPressed: () {
                          selected.value = DataType.memories;
                        },
                        child: const Text('Memories',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
                selected.value == DataType.snaps
                    ? const SnapList()
                    : selected.value == DataType.stories
                        ? const StoriesList()
                        : const MemoriesList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}





/*


*/