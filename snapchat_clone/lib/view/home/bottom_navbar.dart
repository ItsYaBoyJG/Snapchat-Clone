import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapchat_clone/controllers/providers/navbar.dart';
import 'package:snapchat_clone/models/widgets/navbar/navbar.dart';

class BottomNavbar extends ConsumerStatefulWidget {
  const BottomNavbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BottomNavbarState();
  }
}

class _BottomNavbarState extends ConsumerState<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navBarStateProvider);
    return NavBar(
      items: const [
        BottomNavigationBarItem(label: '', icon: Icon(Icons.message)),
        BottomNavigationBarItem(
            label: '', icon: FaIcon(FontAwesomeIcons.globe)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.search_sharp)),
      ],
      currentIndex: currentIndex,
      onTap: (value) {
        ref.read(navBarStateProvider.notifier).state = value;
      },
    );
  }
}
